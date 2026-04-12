import 'dart:async';
import 'dart:io';

import 'package:audio_capture/audio_capture.dart';
import 'package:command_parser/command_parser.dart';
import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:voice_assistant_service/src/audio_device_detector.dart';
import 'package:voice_assistant_service/src/rhoice_client.dart';
import 'package:voice_assistant_service/src/saved_voice_client.dart';
import 'package:voice_assistant_service/src/voice_player.dart';
import 'package:voice_assistant_service/src/vosk_client.dart';

final String syncServiceUrl = Platform.environment['SYNC_SERVICE_URL'] ??
    String.fromEnvironment('SYNC_SERVICE_URL');

final String voskUrl = Platform.environment['VOSK_URL'] ??
    String.fromEnvironment('VOSK_URL',
        defaultValue: 'ws://host.docker.internal:2700');

final String rhvoiceUrl = Platform.environment['RHVOICE_URL'] ??
    String.fromEnvironment('RHVOICE_URL',
        defaultValue: 'http://host.docker.internal:2800');

String? _detectedAudioId;

Completer<List<DeviceEntity>> devicesFetchCompleter = Completer();

final commandParser = CommandParser();

/// Выполняет `aplay -l` чтобы показать доступные устройства воспроизведения
Future<void> showPlaybackDevices() async {
  try {
    final result = await Process.run('aplay', ['-l']);
    if (result.exitCode == 0) {
      final out = (result.stdout ?? '').toString().trim();
      if (out.isNotEmpty) {
        print('🔊 Доступные устройства воспроизведения (aplay -l):');
        print(out);
      } else {
        print('🔊 aplay -l вернул пустой вывод.');
      }
    } else {
      final err = (result.stderr ?? '').toString().trim();
      print('⚠️ aplay -l завершился с кодом ${result.exitCode}. stderr: $err');
    }
  } catch (e) {
    print('⚠️ Не удалось выполнить `aplay -l`: $e');
  }
}

void main() async {
  final locator = GetIt();

  await initModules(locator);

  final devicesController = IDevicesController.create(
    repository: locator.get(),
    projectId: -1,
  );
  final audioCaptureDevicesController =
      IAudioCaptureDevicesController.create(repository: locator.get());

  locator.registerSingleton(devicesController);
  locator.registerSingleton(audioCaptureDevicesController);

  fetchDevices(devicesController: devicesController);
  fetchAvailableDevices(controller: audioCaptureDevicesController);

  await updateCaptureDevicesOnServer(
    locator: locator,
  );

  print("🏠 Голосовой ассистент умного дома v1.0.3");
  print("🎤 Ассистент слушает...");
  print("🔗 Vosk URL: $voskUrl");
  print("🔗 RHVoice URL: $rhvoiceUrl");
  print("🔗 Sync Service URL: $syncServiceUrl");

  // Показываем доступные устройства воспроизведения (полезно для отладки в контейнере)
  await showPlaybackDevices();

  // Автоматически определяем audioId если не указан
  String resolvedAudioId = '1,0';
  print("🔍 audioId не указан, ищу USB PnP Sound Device...");
  final device = await AudioDeviceDetector.detectDevice();
  if (device != null) {
    resolvedAudioId = device.audioId;
    _detectedAudioId = device.audioId;
    print("✅ Использую обнаруженное устройство: $device");
  } else {
    // Если не найдено, используем значение по умолчанию
    resolvedAudioId = '1,0';
    print(
        "⚠️  USB устройство не найдено, используются значения по умолчанию: $resolvedAudioId");
  }

  // Показываем все доступные устройства для отладки
  print("\n📊 Все доступные устройства воспроизведения:");
  final allDevices = await AudioDeviceDetector.listAllDevices();
  for (final dev in allDevices) {
    print("  - $dev");
  }
  print("");

  // Ждем, пока сервер Vosk полностью загрузится

  final voicePlayer = VoicePlayer(
    audioCardId: resolvedAudioId.split(',')[0],
    deviceId: resolvedAudioId.split(',')[1],
  );
  await voicePlayer.play(
      audioStream: rhoiceClient.synthesize(
    "Голосовой ассистент умного дома запущен и готов к работе",
  ));

  try {
    print(
        "👂 Слушаю команды... (говорите 'кузя включи свет' или 'кузя выключи свет')");

    Map<int, Completer<void>> recordingDeviceCompleters = {};

    void update(List<DeviceEntity> devices) async {
      commandParser.setDevices(devices);

      List<int> toRemove = [];
      for (final id in recordingDeviceCompleters.keys) {
        if (devices.indexWhere((d) => d.id == id) == -1) {
          // Устройство было удалено
          toRemove.add(id);
        }
      }
      for (final id in toRemove) {
        print("🛑 Остановка записи с устройства ID $id");
        recordingDeviceCompleters[id]?.complete();
        recordingDeviceCompleters.remove(id);
      }

      for (final device in devices) {
        if (device.providerType == DeviceProviderType.hardware &&
            device.type == DeviceType.microphone) {
          if (recordingDeviceCompleters.containsKey(device.id)) {
            // Уже записываем с этого устройства
            continue;
          }
          print("🎤 Запись с устройства '${device.name}'");
          final completer = Completer<void>();
          recordingDeviceCompleters[device.id] = completer;
          await recordingDevice(device, devicesController,
              completer: completer, audioId: resolvedAudioId);
        }
      }
    }

    final devices =
        devicesController.state.data ?? await devicesFetchCompleter.future;

    update(devices);

    devicesController.stateChanged.listen((state) {
      state.mapOrNull(success: (state) {
        final devices = state.data;
        update(devices);
      });
    });

    // Ждем завершения процесса
  } catch (e) {
    print("Ошибка: $e");
  }
}

bool _checkDeviceEnabled(DeviceEntity device, DevicesState state) {
  bool deviceEnabled = false;
  state.mapOrNull(success: (state) {
    final devices = state.data;
    for (final d in devices) {
      if (d.id == device.id) {
        device = d;
        for (final cap in d.capabilities) {
          if (cap.maybeMap(
            orElse: () => false,
            onOff: (e) => e.state!.maybeMap(
              orElse: () => false,
              on: (state) => state.value == true,
            ),
          )) {
            deviceEnabled = true;
            break;
          }
        }
        break;
      }
    }
  });
  return deviceEnabled;
}

final rhoiceClient = RhvoiceClient(rhvoiceUrl);
final savedVoiceClient = SavedVoiceClient();

DeviceEntity? _activeCuptureDevice;

Voice currentVoice = Voice.kuzya;

Future<void> recordingDevice(
  DeviceEntity device,
  IDevicesController devicesController, {
  required Completer<void> completer,
  required String audioId,
}) async {
  final voicePlayer = VoicePlayer(
    audioCardId: audioId.split(',')[0],
    deviceId: audioId.split(',')[1],
  );

  final voskClient = VoskClient(voskUrl);
  await voskClient.connect();

  final splitted = device.providerDeviceId!.split(',');
  final audioCardId = splitted[0];
  final deviceId = splitted[1];

  VoiceRecorder recorder =
      VoiceRecorder(audioCardId: audioCardId, deviceId: deviceId);
  final chunkedRecorder = ChunkedVoiceRecorder(recorder);

  await recorder.startRecording();

  // int chunkCounter = 0;

  chunkedRecorder.audioStream.listen((audioData) {
    final isEnabled = _checkDeviceEnabled(device, devicesController.state);
    if (!isEnabled || voicePlayer.isPlaying) return;
    voskClient.sendAudio(audioData);
  });

  voskClient.onMessage.listen((message) {
    final text = message.text;

    // Активный девайс тот кто первый прислал partial
    if (text.isEmpty) {
      if (message.partial.isNotEmpty && _activeCuptureDevice == null) {
        _activeCuptureDevice = device;
        print("🎤 Активное устройство для команд: ${device.name}");
      }
      return;
    }
    if (device != _activeCuptureDevice) return;
    _activeCuptureDevice = null;

    print("🗣️  (${device.name}) Распознано: '$text'");
    final devices = devicesController.state.data;
    if (devices == null) return;

    // Проверяем команды
    if (text.contains('поменяй голос')) {
      // Команда на смену голоса
      if (currentVoice == Voice.kuzya) {
        currentVoice = Voice.putin;
        print("🎤 Голос сменен на Путин");
        playSavedText(VoiceText.done, voicePlayer);
      } else {
        currentVoice = Voice.kuzya;
        print("🎤 Голос сменен на Кузя");
        playSavedText(VoiceText.done, voicePlayer);
      }
      return;
    } else {
      final results = commandParser.parse(text);
      if (results.isEmpty) return;
      bool onlyOn = results.every((result) =>
          result.maybeMap(orElse: () => false, onOff: (s) => s.isOn));
      bool onlyOff = results.every((result) =>
          result.maybeMap(orElse: () => false, onOff: (s) => !s.isOn));
      bool hasSay = false;
      for (final result in results) {
        result.map(
          onOff: (result) {
            if (result.device.capabilities
                .where((cap) =>
                    cap.maybeMap(orElse: () => false, onOff: (_) => true))
                .isEmpty) {
              print(
                  "❌ Устройство '${result.device.name}' не поддерживает управление включением/выключением.");
              playSavedText(VoiceText.undone, voicePlayer);
              hasSay = true;
              return;
            }
            devicesController.needChangeDevicesCapabilities(inputs: [
              (
                device: result.device,
                input: [
                  DeviceCapabilityEntity.onOff(
                    state: DeviceCapabilityStateEntity.on(
                      value: result.isOn,
                    ),
                    parameters: null,
                  ),
                ]
              ),
            ]);
          },
          open: (result) {
            if (result.device.type == DeviceType.doorWithLock) {
              print(
                  "🔄 Изменение состояния устройства '${result.device.name}' на ${result.openValue == 100 ? 'ОТКРЫТО' : 'ЗАКРЫТО'}");
              return devicesController.needChangeDevicesCapabilities(inputs: [
                (
                  device: result.device,
                  input: [
                    DeviceCapabilityEntity.onOff(
                      state: DeviceCapabilityStateEntity.on(
                        value: result.openValue == 100,
                      ),
                      parameters: null,
                    ),
                  ]
                ),
              ]);
            }
            if (result.device.capabilities
                .where((cap) =>
                    cap.maybeMap(orElse: () => false, range: (_) => true))
                .isEmpty) {
              print(
                  "❌ Устройство '${result.device.name}' не поддерживает управление диапазоном.");
              playSavedText(VoiceText.undone, voicePlayer);
              hasSay = true;
              return;
            }
            print(
                "🔄 Изменение состояния устройства '${result.device.name}' на значение ${result.openValue}");
            devicesController.needChangeDevicesCapabilities(inputs: [
              (
                device: result.device,
                input: [
                  DeviceCapabilityEntity.range(
                    state: DeviceCapabilityStateEntity.open(
                      value: result.openValue,
                    ),
                    parameters: null,
                  ),
                ]
              ),
            ]);
          },
          sayTemperature: (result) {
            final currentTemp = result.temperature;
            hasSay = true;
            print("ℹ️ Текущая температура ${currentTemp.toInt()} градус(ов)");
            switch (currentTemp.toInt()) {
              case 16:
                playSavedText(VoiceText.temp16, voicePlayer);
                break;
              case 17:
                playSavedText(VoiceText.temp17, voicePlayer);
                break;
              case 18:
                playSavedText(VoiceText.temp18, voicePlayer);
                break;
              case 19:
                playSavedText(VoiceText.temp19, voicePlayer);
                break;
              case 20:
                playSavedText(VoiceText.temp20, voicePlayer);
                break;
              case 21:
                playSavedText(VoiceText.temp21, voicePlayer);
                break;
              case 22:
                playSavedText(VoiceText.temp22, voicePlayer);
                break;
              case 23:
                playSavedText(VoiceText.temp23, voicePlayer);
                break;
              case 24:
                playSavedText(VoiceText.temp24, voicePlayer);
                break;
              case 25:
                playSavedText(VoiceText.temp25, voicePlayer);
                break;
              case 26:
                playSavedText(VoiceText.temp26, voicePlayer);
                break;
              case 27:
                playSavedText(VoiceText.temp27, voicePlayer);
                break;
              case 28:
                playSavedText(VoiceText.temp28, voicePlayer);
                break;
              case 29:
                playSavedText(VoiceText.temp29, voicePlayer);
                break;
              case 30:
                playSavedText(VoiceText.temp30, voicePlayer);
                break;
              default:
                playText("Текущая температура ${currentTemp.toInt()} градус",
                    voicePlayer);
                break;
            }
          },
        );
      }
      if (hasSay) return;
      if (onlyOff) {
        playSavedText(VoiceText.lightOff, voicePlayer);
      } else if (onlyOn) {
        playSavedText(VoiceText.lightOn, voicePlayer);
      } else {
        playSavedText(VoiceText.done, voicePlayer);
      }
    }

    // } else if (text.contains('температура')) {
    //   // Команда на температуру
    //   final temperatureDevice = devices.firstWhereOrNull((d) => d.properties
    //       .any((prop) => prop.state is DeviceCapabilityStateTemperatureEntity));
    //   if (temperatureDevice != null) {
    //     // Запрос текущей температуры
    //     final currentTemp = (temperatureDevice.properties
    //             .firstWhere((prop) =>
    //                 prop.state is DeviceCapabilityStateTemperatureEntity)
    //             .state as DeviceCapabilityStateTemperatureEntity)
    //         .value;

    //   } else {
    //     playSavedText(VoiceText.undone, voicePlayer);
    //     // playText(
    //     //     "Устройство для измерения температуры не найдено", voicePlayer);
    //   }
    // } else {
    //   print("❓ Команда не распознана.");
    // }
  });

  completer.future.then((_) async {
    await chunkedRecorder.stop();
    voskClient.close();
    voicePlayer.dispose();
  });
}

Future<void> playSavedText(VoiceText text, VoicePlayer player) async {
  await player.play(
    audioStream: savedVoiceClient.synthesize(text, voice: currentVoice),
  );
}

Future<void> playText(String text, VoicePlayer player) async {
  await player.play(audioStream: rhoiceClient.synthesize(text));
}

Future<void> initModules(GetIt locator) async {
  // Initialize your services here
  final dio = Dio(
    BaseOptions(
      baseUrl: '$syncServiceUrl/api/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-App-Client': 'voice-assistant-service',
      },
    ),
  );
  locator.registerSingleton(dio);

  await EventsModule.init(locator: locator, wsUrl: syncServiceUrl);
  await DevicesModule.init(locator: locator);
  await AudioCaptureModule.init(locator: locator);
}

void fetchDevices({required IDevicesController devicesController}) {
  devicesController.fetch();

  devicesController.stateChanged.listen((state) {
    state.mapOrNull(
      failure: (state) async {
        await Future.delayed(Duration(seconds: 5));
        devicesController.fetch();
      },
      success: (state) {
        if (!devicesFetchCompleter.isCompleted) {
          devicesFetchCompleter.complete(state.data);
        }
      },
    );
  });
}

void fetchAvailableDevices(
    {required IAudioCaptureDevicesController controller}) {
  controller.fetch();

  controller.stateChanged.listen((state) {
    state.mapOrNull(
      failure: (state) async {
        await Future.delayed(Duration(seconds: 5));
        controller.fetch();
      },
      success: (state) async {
        await Future.delayed(Duration(seconds: 5));
        controller.fetch();
      },
    );
  });
}

Future<void> updateCaptureDevicesOnServer({
  required GetIt locator,
}) async {
  final waitCompleter = Completer<void>();
  List<AudioCaptureDeviceEntity>? lastCaptureDevices;
  locator.get<IAudioCaptureDevicesController>().stateChanged.listen(
        (state) => state.mapOrNull(success: (state) async {
          final availableCaptureDevices = state.data;
          if (lastCaptureDevices != null &&
              ListEquality()
                  .equals(lastCaptureDevices, availableCaptureDevices)) {
            return null;
          }
          for (final device in availableCaptureDevices) {
            print(
                "🎤 Найдено устройство для захвата: '${device.name}' (Card ID: ${device.cardId}, Device ID: ${device.deviceId})");
          }
          lastCaptureDevices = availableCaptureDevices;
          final needCreateCaptureDevicesId = {
            for (var device in availableCaptureDevices)
              '${device.cardId},${device.deviceId}': device
          };
          print('Ждем получения списка устройств...');
          final devices = locator.get<IDevicesController>().state.data ??
              await devicesFetchCompleter.future;
          print('Сверяем с устройствами на сервере...');
          final updateInputs = <int, DeviceInputEntity>{};
          final deleteInputs = <int>{};
          for (final device in devices) {
            if (device.providerType == DeviceProviderType.hardware &&
                device.type == DeviceType.microphone) {
              bool hasCaptureDevice = false;
              for (final captureDevice in availableCaptureDevices) {
                if (device.providerDeviceId ==
                    '${captureDevice.cardId},${captureDevice.deviceId}') {
                  needCreateCaptureDevicesId.remove(device.providerDeviceId);
                  hasCaptureDevice = true;
                  if (device.name != captureDevice.name) {
                    updateInputs[device.id] = DeviceInputEntity(
                      providerDeviceId: device.providerDeviceId,
                      providerType: device.providerType,
                      type: device.type,
                      inputId: device.inputId,
                      outputId: device.outputId,
                      name: captureDevice.name,
                      capabilities: device.capabilities,
                      properties: device.properties,
                      roomId: device.roomId,
                      floorId: device.floorId,
                    );
                    print(
                        "ℹ️ Обновлено имя аудио устройства '${device.name}' -> '${captureDevice.name}'");
                  }
                  break;
                }
              }
              if (!hasCaptureDevice) {
                deleteInputs.add(device.id);
                print(
                    "🗑️ Удалено аудио устройство '${device.name}' (ID: ${device.id})");
              }
            }
          }
          final createInputs = <DeviceInputEntity>[];
          for (final captureDevice in needCreateCaptureDevicesId.values) {
            createInputs.add(
                AudioCaptureDeviceMapper.toDeviceInput(from: captureDevice));
          }

          int waitSeconds = 0;

          if (deleteInputs.isNotEmpty) {
            for (final deviceId in deleteInputs) {
              waitSeconds += 1;
              final deleteController = IDeleteDeviceController.create(
                repository: locator.get(),
                deviceId: deviceId,
                projectId: -1,
              );
              deleteController.delete();
            }
          }
          if (updateInputs.isNotEmpty) {
            for (final entry in updateInputs.entries) {
              waitSeconds += 1;
              final updateController = IUpdateDeviceController.create(
                repository: locator.get(),
                deviceId: entry.key,
                projectId: -1,
              );
              updateController.update(input: entry.value);
            }
          }
          if (createInputs.isNotEmpty) {
            for (final input in createInputs) {
              waitSeconds += 1;
              final createController = ICreateDeviceController.create_(
                repository: locator.get(),
                projectId: -1,
              );
              createController.create(input: input);
              print("➕ Создано аудио устройство '${input.name}'");
            }
          }

          if (waitSeconds > 0) {
            fetchDevices(
              devicesController: locator.get(),
            );
          }
          await Future.delayed(Duration(seconds: waitSeconds));
          if (!waitCompleter.isCompleted) waitCompleter.complete();

          return null;
        }),
      );
  await waitCompleter.future;
}

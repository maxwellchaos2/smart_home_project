import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

class VoiceRecorder {
  final String audioCardId;
  final String deviceId;

  VoiceRecorder({this.audioCardId = '0', this.deviceId = '0'});

  Process? _recordProcess;
  final StreamController<Uint8List> _audioStreamController =
      StreamController<Uint8List>();

  Stream<Uint8List> get audioStream => _audioStreamController.stream;

  bool _isRecording = false;

  Future<void> startRecording() async {
    if (_isRecording) return;

    await _initializeAudio();
    await _startAudioCapture();
  }

  Future<void> _initializeAudio() async {
    if (Platform.isLinux) {
      print("🎤 Инициализация микрофона Orange Pi 3 LTS...");

      // Загружаем AC200 модули
      await Process.run('modprobe', ['snd-soc-ac200'], runInShell: true);
      await Process.run('modprobe', ['ac200'], runInShell: true);

      // Настраиваем микрофон
      // await _setupMicrophone();
    }
  }

  // Future<void> _setupMicrophone() async {
  //   print("🎚️  Настройка микрофона AC200...");

  //   final micSettings = [
  //     ['amixer', 'set', 'MIC1', '100%', 'cap', 'on', 'unmute'],
  //     ['amixer', 'set', 'MIC2', '100%', 'cap', 'on', 'unmute'],
  //     ['amixer', 'set', 'MIC1 Boost', '100%'],
  //     ['amixer', 'set', 'MIC2 Boost', '100%'],
  //     ['amixer', 'set', 'ADC', '100%', 'on'],
  //     ['amixer', 'set', 'I2S ADC', '100%', 'cap', 'on'],
  //     ['amixer', 'set', 'Output Mixer', 'cap', 'on'],
  //   ];

  //   for (final cmd in micSettings) {
  //     try {
  //       await Process.run(cmd[0], cmd.sublist(1), runInShell: true);
  //     } catch (e) {
  //       print("⚠️  ${cmd.join(' ')}: $e");
  //     }
  //   }
  // }

  Future<void> _startAudioCapture() async {
    try {
      // Определяем команду для записи в зависимости от платформы
      String command;
      List<String> args;
      final soxCheck = await Process.run('which', ['sox']);
      if (soxCheck.exitCode != 0) {
        throw Exception(
          "❌ Не найден SoX. Установите его:\n"
          "sudo apt install sox libsox-fmt-all",
        );
      }

      if (Platform.isLinux) {
        // Сначала пробуем SoX
        command = 'sox';
        // sox -t alsa plughw:1,0 -t raw -r 16000 -c 1 -b 16 -e signed-integer -L -
        args = [
          '-t', 'alsa', // Тип входа: ALSA
          'plughw:$audioCardId,$deviceId', // Устройство по ID
          '-t', 'raw', // RAW формат
          '-r', '16000', // 16kHz
          '-c', '1', // Моно
          '-b', '16', // 16-bit
          '-e', 'signed-integer', // Знаковые целые
          '-L', // Little endian
          '-' // Вывод в stdout
        ];
      } else if (Platform.isMacOS) {
        // Проверяем наличие SoX
        command = 'sox';
        args = [
          '-t', 'coreaudio', // macOS CoreAudio backend
          '-d', 'default',
          '-t', 'raw', // RAW формат
          '-r', '16000', // 16kHz
          '-c', '1', // Моно
          '-b', '16', // 16-bit
          '-e', 'signed-integer', // Знаковые целые
          '-L', // Little endian
          '-' // Вывод в stdout
        ];
      } else {
        throw UnsupportedError('Платформа не поддерживается');
      }

      print("🎙️  Запуск $command: $command ${args.join(' ')}");

      _recordProcess = await Process.start(command, args);
      _isRecording = true;

      // Слушаем аудиоданные
      _recordProcess!.stdout.listen(
        (data) {
          if (data.isNotEmpty) {
            _audioStreamController.add(Uint8List.fromList(data));
            // _processAudioData(Uint8List.fromList(data));
          }
        },
        onError: (error) {
          print("❌ Ошибка записи: $error");
          _stopRecording();
        },
        onDone: () {
          print("🛑 Запись завершена");
          _isRecording = false;
        },
      );

      // Слушаем ошибки
      _recordProcess!.stderr.listen((data) {
        final error = String.fromCharCodes(data);
        if (!error.contains('underrun')) {
          // Игнорируем обычные underrun
          // print("⚠️  arecord stderr: $error");
        }
      });

      print("✅ Запись началась с устройства plughw:$audioCardId,$deviceId");
    } catch (e) {
      print("❌ Ошибка запуска записи: $e");
      _isRecording = false;
    }
  }

  // void _processAudioData(Uint8List audioData) {
  //   // Конвертируем 22kHz -> 16kHz для Vosk
  //   final convertedData = _resampleAudio(audioData);

  //   if (convertedData.isNotEmpty) {
  //     _audioStreamController.add(convertedData);
  //   }
  // }

  // Uint8List _resampleAudio(Uint8List input) {
  //   // Простая децимация 22050 -> 16000 (примерно каждый 1.38 семпл)
  //   if (input.length < 4) return input;

  //   final samples = input.length ~/ 2; // 16-bit = 2 байта на семпл
  //   final outputSamples = (samples * 16000 / 22050).round();
  //   final output = Uint8List(outputSamples * 2);

  //   for (int i = 0; i < outputSamples; i++) {
  //     final sourceIndex = (i * 22050 / 16000).round() * 2;
  //     if (sourceIndex < input.length - 1) {
  //       output[i * 2] = input[sourceIndex];
  //       output[i * 2 + 1] = input[sourceIndex + 1];
  //     }
  //   }

  //   return output;
  // }

  Future<void> _stopRecording() async {
    if (_recordProcess != null && _isRecording) {
      _recordProcess!.kill();
      await _recordProcess!.exitCode;
      _recordProcess = null;
      _isRecording = false;
      print("🛑 Запись остановлена");
    }
  }

  Future<void> dispose() async {
    await _stopRecording();
    await _audioStreamController.close();
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:zigbee_devices/zigbee_devices.dart';
import 'package:zigbee_service/src/zigbee_mqtt_service.dart';

final String syncServiceUrl = Platform.environment['SYNC_SERVICE_URL'] ??
    String.fromEnvironment('SYNC_SERVICE_URL');

Completer<List<DeviceEntity>> devicesFetchCompleter = Completer();

void main() async {
  final locator = GetIt();
  await initModules(locator);

  final devicesController = IDevicesController.create(
    repository: locator.get(),
    projectId: -1,
  );

  locator.registerSingleton(devicesController);

  fetchDevices(devicesController: devicesController);

  await devicesFetchCompleter.future;

  final eventsController = locator.get<IEventsRepository>();

  final zigbee = ZigbeeMqttService(
    broker: Platform.environment['ZIGBEE_BROKER'] ??
        String.fromEnvironment('ZIGBEE_BROKER', defaultValue: 'localhost'),
    port: int.tryParse(
          Platform.environment['ZIGBEE_PORT'] ??
              String.fromEnvironment('ZIGBEE_PORT', defaultValue: '1883'),
        ) ??
        1883,
  );

  await zigbee.connect();

  List<ZigbeeDeviceModel> zigbeeDevices = [];

  zigbee.deviceInterviewed.listen((device) {
    print('✅ Устройство завершило интервью: ${device.ieeeAddress}');
    final properties = ZigbeePayloadMapper.toProperties(
      changedState: null,
      device: device,
      isNew: true,
    );
    final capabilities = ZigbeePayloadMapper.toCapabilities(
      changedState: null,
      device: device,
      isNew: true,
    );

    zigbee.getDeviceState(device.friendlyName);
    eventsController.sendMessages(messages: [
      EventMessageInputEntity.newZigbeeDevice(
        device: {
          'id': device.ieeeAddress,
          'name': device.definition?.description ?? device.friendlyName,
          'type': DeviceTypeMapper.toModel(
            from: ZigbeeTypeMapper.toDeviceType(
              from: device,
              changedState: null,
            ),
          ),
          'capabilities': capabilities,
          'properties': properties,
          'interviewCompleted': true,
        },
      ),
    ]);
  });

  // Слушаем все события
  zigbee.messages.listen((msg) {
    if ([
      'zigbee2mqtt/bridge/definitions',
      'zigbee2mqtt/bridge/info',
      'zigbee2mqtt/bridge/logging',
    ].contains(msg.topic)) {
      // Игнорируем определения
      return;
    }
    print("📩 Топик: ${msg.topic}, Данные: ${msg.payload}");
    if (msg.topic.startsWith('zigbee2mqtt/')) {
      final deviceTopic = msg.topic.replaceFirst('zigbee2mqtt/', '');
      final zigbeeDevice = zigbeeDevices.firstWhereOrNull(
        (d) => d.friendlyName == deviceTopic,
      );
      if (zigbeeDevice != null && msg.payload.isNotEmpty) {
        final payload = jsonDecode(msg.payload) as Map<String, dynamic>;
        if (payload.isEmpty) {
          return;
        }
        // print('Capabilities: $capabilities');

        final device = devicesController.state.data!.firstWhereOrNull((d) =>
            d.providerType == DeviceProviderType.zigbee &&
            d.providerDeviceId == zigbeeDevice.ieeeAddress);
        final properties = ZigbeePayloadMapper.toProperties(
          changedState: payload,
          device: zigbeeDevice,
          isNew: device == null,
        );
        final capabilities = ZigbeePayloadMapper.toCapabilities(
          changedState: payload,
          device: zigbeeDevice,
          isNew: device == null,
        );
        print(
            '♻️ Обновление состояния: ${device?.name ?? zigbeeDevice.friendlyName}');
        if (device == null) {
          eventsController.sendMessages(messages: [
            EventMessageInputEntity.newZigbeeDevice(
              device: {
                'id': zigbeeDevice.ieeeAddress,
                'name': zigbeeDevice.definition?.description ??
                    zigbeeDevice.friendlyName,
                'type': DeviceTypeMapper.toModel(
                  from: ZigbeeTypeMapper.toDeviceType(
                    from: zigbeeDevice,
                    changedState: payload,
                  ),
                ),
                'capabilities': capabilities,
                'properties': properties,
                'interviewCompleted': zigbeeDevice.interviewCompleted,
              },
            ),
          ]);
        } else if (properties.isNotEmpty || capabilities.isNotEmpty) {
          eventsController.sendMessages(messages: [
            if (properties.isNotEmpty)
              EventMessageInputEntity.devicePropertiesChanged(
                deviceId: device.id,
                properties: properties,
              ),
            if (capabilities.isNotEmpty)
              EventMessageInputEntity.deviceCapabilitiesChanged(
                deviceId: device.id,
                capabilities: capabilities,
              ),
          ]);
        }
      }
    }
  });

  zigbee.devicesStream.listen((event) {
    print('🔌 Найдено устройств: ${event.length}');
    for (final device in event) {
      if (zigbeeDevices.isEmpty ||
          zigbeeDevices.any((d) => d.ieeeAddress == device.ieeeAddress)) {
        continue;
      }
      final properties = ZigbeePayloadMapper.toProperties(
        changedState: null,
        device: device,
        isNew: true,
      );
      final capabilities = ZigbeePayloadMapper.toCapabilities(
        changedState: null,
        device: device,
        isNew: true,
      );

      zigbee.getDeviceState(device.friendlyName);
      eventsController.sendMessages(messages: [
        EventMessageInputEntity.newZigbeeDevice(
          device: {
            'id': device.ieeeAddress,
            'name': device.definition?.description ?? device.friendlyName,
            'type': DeviceTypeMapper.toModel(
              from: ZigbeeTypeMapper.toDeviceType(
                from: device,
                changedState: null,
              ),
            ),
            'capabilities': capabilities,
            'properties': properties,
            'interviewCompleted': device.interviewCompleted,
          },
        ),
      ]);

      print(
        '- ${device.friendlyName} (${device.ieeeAddress}), '
        'модель: ${device.modelId}, производитель: ${device.manufacturer}, '
        'описание: ${device.definition?.description ?? 'N/A'}',
      );
    }
    zigbeeDevices = event;
  });

  eventsController.onEvents.listen((events) async {
    for (final event in events) {
      event.mapOrNull(
        permitJoinZigbeeDevices: (event) {
          print('🔓 Разрешение на присоединение новых устройств Zigbee');
          zigbee.permitJoin(
            duration: event.time,
            value: event.value,
          );
        },
        needDeviceCapabilitiesChange: (event) {
          final device = devicesController.state.data!.firstWhereOrNull(
            (d) => d.id == event.deviceId,
          );
          if (device != null &&
              device.providerType == DeviceProviderType.zigbee) {
            final zigbeeDevice = zigbeeDevices.firstWhereOrNull(
              (d) => d.ieeeAddress == device.providerDeviceId,
            );
            if (zigbeeDevice == null) {
              print('⚠️ Устройство не найдено в Zigbee: ${device.name}');
              return;
            }
            final payload = ZigbeePayloadMapper.fromCapabilities(
              capabilities: event.capabilities,
              device: zigbeeDevice,
            );
            if (payload.isNotEmpty) {
              print('🔃 Изменение состояния: $payload');
              zigbee.sendCommand(zigbeeDevice.friendlyName, payload);
            }
          }
        },
      );
    }
  });
}

// void pingWebSocket(WebSocket webSocket) {
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     if (webSocket.readyState == WebSocket.open && webSocket.closeCode == null) {
//       webSocket.add('ping');
//     } else {
//       timer.cancel();
//     }
//   });
// }

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

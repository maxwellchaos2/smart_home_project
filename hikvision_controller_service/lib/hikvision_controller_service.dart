import 'dart:async';
import 'dart:io';

import 'package:access_control/access_control.dart';
import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:isapi/isapi.dart';

//file:///Users/vzotov/Downloads/isapi.pdf
// 133 - Слушать событие
// 123 - Отправить аудио на устройство
// /ISAPI/System/IO/inputs - глянуть что это

final String syncServiceUrl = Platform.environment['SYNC_SERVICE_URL'] ??
    String.fromEnvironment('SYNC_SERVICE_URL');

final String hikvisionIp = Platform.environment['HIKVISION_IP'] ??
    String.fromEnvironment('HIKVISION_IP');

final String hikvisionUser = Platform.environment['HIKVISION_USER'] ??
    String.fromEnvironment('HIKVISION_USER');

final String hikvisionPassword = Platform.environment['HIKVISION_PASSWORD'] ??
    String.fromEnvironment('HIKVISION_PASSWORD');

Completer<List<DeviceEntity>> devicesFetchCompleter = Completer();

Future<DeviceEntity> getHikvisionDevice(
    IDevicesController devicesController) async {
  final devices =
      devicesController.state.data ?? await devicesFetchCompleter.future;

  final device = devices.firstWhere(
    (d) =>
        d.type == DeviceType.doorWithLock &&
        d.providerType == DeviceProviderType.hikvision &&
        d.providerDeviceId == hikvisionIp,
    orElse: () => throw Exception('Hikvision device not found'),
  );
  return device;
}

void main() async {
  final locator = GetIt();
  await initModules(locator);

  final devicesController = IDevicesController.create(
    repository: locator.get(),
    projectId: -1,
  );

  locator.registerSingleton(devicesController);

  fetchDevices(devicesController: devicesController);

  _heartbeatDevice(locator);

  final devices =
      devicesController.state.data ?? await devicesFetchCompleter.future;

  await _createDeviceIfNotExists(
    devicesController,
    ICreateDeviceController.create_(
      repository: locator.get(),
      projectId: -1,
    ),
    devices,
  );

  final eventsController = locator.get<IEventsRepository>();
  eventsController.onEvents.listen(
    (events) async {
      for (final event in events) {
        event.mapOrNull(
          needDeviceCapabilitiesChange: (event) async {
            final device = await getHikvisionDevice(devicesController);
            if (device.id != event.deviceId) return;
            for (final capability in event.capabilities) {
              if (capability.state?.mapOrNull(on: (_) => true) ?? false) {
                final value = capability.state?.mapOrNull(on: (s) => s.value);
                if (value == null) continue;
                if (value == true) {
                  final controller = IOpenDoorController.create(
                    repository: locator.get(),
                    doorId: 1,
                  );
                  controller.open();
                } else {
                  final controller = ICloseDoorController.create(
                    repository: locator.get(),
                    doorId: 1,
                  );
                  controller.close();
                }
              }
            }
          },
        );
      }
    },
  );

  final sub = locator.get<IISAPIClient>().listenEvents().listen((event) async {
    if (event['eventType'] == 'AccessControllerEvent') {
      final e = event['AccessControllerEvent'];
      print(switch (e['subEventType']) {
        21 => 'Замок разблокирован',
        22 => 'Замок заблокирован',
        26 => 'Дверь открыта',
        27 => 'Дверь закрыта',
        28 => 'Таймаут открытой двери',
        75 => 'Аутентификация с лицом (${e["name"]})',
        1032 => 'Event Input Alarm',
        1024 => 'Замок разблокирован с приложения',
        _ => 'Неизвестное событие: ${e['subEventType']}',
      });

      if (e['subEventType'] == 21 || e['subEventType'] == 22) {
        final device = await getHikvisionDevice(devicesController);
        final isOn = e['subEventType'] == 21;
        devicesController.devicesCapabilitiesChanged(inputs: [
          (
            device: device,
            input: [
              DeviceCapabilityEntity.onOff(
                state: DeviceCapabilityStateEntity.on(value: isOn),
                parameters: null,
              ),
            ]
          )
        ]);
      } else if (e['subEventType'] == 26 || e['subEventType'] == 27) {
        final device = await getHikvisionDevice(devicesController);
        final isClosed = e['subEventType'] == 27;
        devicesController.devicesPropertiesChanged(inputs: [
          (
            device: device,
            input: [
              _buildContactProperty(contact: isClosed),
            ]
          )
        ]);
      }
    }
  });

  await sub.asFuture<void>();

  return;
}

//   final devicesController =
//       IDevicesController.create(repository: locator.get());

//   locator.registerSingleton(devicesController);

//   fetchDevices(devicesController: devicesController);

//   // final devices =
//   //     devicesController.state.data ?? await devicesFetchCompleter.future;
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
  await ISAPIModule.init(
    locator: locator,
    host: hikvisionIp,
    username: hikvisionUser,
    password: hikvisionPassword,
  );
  await AccessControlModule.init(locator: locator);
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

DevicePropertyEntity _buildContactProperty({required bool contact}) {
  return DevicePropertyEntity.event(
    state: {
      'instance': 'open',
      'value': contact ? 'closed' : 'opened',
    },
    parameters: {
      "instance": "open",
      "events": [
        {"value": "opened", "name": "Дверь открыта", "original": false},
        {"value": "closed", "name": "Дверь закрыта", "original": true}
      ],
    },
  );
}

Future<void> _createDeviceIfNotExists(
  IDevicesController devicesController,
  ICreateDeviceController createDeviceController,
  List<DeviceEntity> devices,
) async {
  final deviceIsAdded = devices.any(
    (d) =>
        d.type == DeviceType.doorWithLock &&
        d.providerType == DeviceProviderType.hikvision &&
        d.providerDeviceId == hikvisionIp,
  );

  if (!deviceIsAdded) {
    final input = DeviceInputEntity(
      providerDeviceId: hikvisionIp,
      providerType: DeviceProviderType.hikvision,
      type: DeviceType.doorWithLock,
      inputId: null,
      outputId: null,
      name: 'Дверь с замком',
      capabilities: [
        DeviceCapabilityEntity.onOff(
          state: DeviceCapabilityStateEntity.on(
            value: false,
          ),
          parameters: DeviceCapabilityParametersOnOffEntity(
            split: null,
          ),
        )
      ],
      properties: [
        _buildContactProperty(contact: false),
      ],
      roomId: null,
      floorId: null,
    );
    createDeviceController.create(
      input: input,
    );

    createDeviceController.stateChanged.listen((state) {
      state.mapOrNull(
        failure: (state) {
          print('Create device failed: ${state.failure}');
          createDeviceController.create(
            input: input,
          );
        },
        success: (state) {
          print('Create device success: ${state.data}');
          devicesFetchCompleter = Completer();
          fetchDevices(devicesController: devicesController);
        },
      );
    });
    await devicesFetchCompleter.future;
  }
}

void _heartbeatDevice(GetIt locator) async {
  final device = await getHikvisionDevice(locator.get());
  final eventsController = locator.get<IEventsRepository>();
  await eventsController.sendMessages(messages: [
    EventMessageInputEntity.onDeviceHeartbeat(
      deviceId: device.id,
    )
  ]);
  Timer.periodic(Duration(seconds: 10), (_) async {
    print('Sending heartbeat for device ${device.id}');
    await eventsController.sendMessages(messages: [
      EventMessageInputEntity.onDeviceHeartbeat(
        deviceId: device.id,
      )
    ]);
  });
  return;
}

import 'dart:async';
import 'dart:io';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:logo_controller_service/src/logo_controller_service.dart';

final String syncServiceUrl = Platform.environment['SYNC_SERVICE_URL'] ??
    String.fromEnvironment('SYNC_SERVICE_URL');

final String plcIp = Platform.environment['LOGO_CONTROLLER_IP'] ??
    String.fromEnvironment('LOGO_CONTROLLER_IP');

final String? snap7LibraryPath = Platform.environment['SNAP7_LIBRARY_PATH'] ??
    switch (String.fromEnvironment('SNAP7_LIBRARY_PATH')) {
      '' => null,
      String v => v,
    };

const int rack = 0;
const int slot = 2;

Completer<List<DeviceEntity>> devicesFetchCompleter = Completer();

void main() async {
  final locator = GetIt();
  await initModules(locator);
  final logoController = LogoControllerService();

  final devicesController = IDevicesController.create(
    repository: locator.get(),
    projectId: -1,
  );

  locator.registerSingleton(devicesController);

  fetchDevices(devicesController: devicesController);

  await devicesFetchCompleter.future;

  final eventsController = locator.get<IEventsRepository>();

  logoController.connect(plcIp: plcIp, libraryPath: snap7LibraryPath);

  logoController.addTickListener(() => _onTick(locator));

  logoController.outputChangeStream.listen((output) async {
    final device = devicesController.state.data!
        .firstWhereOrNull((d) => d.providerDeviceId == 'Q${output.id + 1}');
    if (device == null) return;
    eventsController.sendMessages(messages: [
      EventMessageInputEntity.deviceCapabilitiesChanged(
        capabilities: [
          DeviceCapabilityEntity.onOff(
            state: DeviceCapabilityStateEntity.on(value: output.state),
            parameters: null,
          ),
        ],
        deviceId: device.id,
      )
    ]);
  });

  eventsController.onEvents.listen((events) async {
    for (final event in events) {
      event.mapOrNull(
        needDeviceCapabilitiesChange: (event) async {
          final device = devicesController.state.data!.firstWhereOrNull(
            (d) => d.id == event.deviceId,
          );
          if (device?.providerType == DeviceProviderType.logoSiemens &&
              device?.providerDeviceId?.startsWith('Q') == true) {
            final onOffCapability = event.capabilities.firstWhereOrNull(
              (capability) => capability.state is DeviceCapabilityStateOnEntity,
            );
            final deviceState = (device!.capabilities
                .firstWhereOrNull(
                  (capability) =>
                      capability.state is DeviceCapabilityStateOnEntity,
                )
                ?.state as DeviceCapabilityStateOnEntity?);
            if (onOffCapability == null) return;
            await logoController.writeNI(
              int.parse(device.providerDeviceId!.substring(1)) - 1,
              (onOffCapability.state as DeviceCapabilityStateOnEntity).value ??
                  (deviceState?.value == true ? false : true),
            );
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
        'X-App-Client': 'scenarios-service',
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

void _onTick(GetIt locator) {
  final devicesController = locator.get<IDevicesController>();
  final now = DateTime.now();
  if (now.difference(_lastHeartbeat).inSeconds >= 10) {
    final devices = devicesController.state.data!
        .where((d) =>
            d.type == DeviceType.controlBoxHub ||
            (d.providerType == DeviceProviderType.logoSiemens &&
                d.providerDeviceId!.startsWith('Q')))
        .toList();
    _lastHeartbeat = now;
    if (devices.isEmpty) return;
    _heartbeatDevice(locator, devices);
  }
}

DateTime _lastHeartbeat = DateTime.now();

void _heartbeatDevice(GetIt locator, List<DeviceEntity> devices) async {
  final eventsController = locator.get<IEventsRepository>();
  await eventsController.sendMessages(messages: [
    for (final device in devices)
      EventMessageInputEntity.onDeviceHeartbeat(
        deviceId: device.id,
      )
  ]);
  return;
}

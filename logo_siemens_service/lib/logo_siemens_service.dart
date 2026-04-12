import 'dart:async';
import 'dart:io';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:inout_scenarios/inout_scenarios.dart';

import 'src/logo_siemens_controller.dart';

final String syncServiceUrl =
    Platform.environment['SYNC_SERVICE_URL'] ??
    String.fromEnvironment('SYNC_SERVICE_URL');

final String mqttHost =
    Platform.environment['MQTT_BROKER'] ??
    String.fromEnvironment('MQTT_BROKER');

final int mqttHostPort =
    int.tryParse(
      Platform.environment['MQTT_BROKER_PORT'] ??
          String.fromEnvironment('MQTT_BROKER_PORT'),
    ) ??
    1883;

Completer<List<DeviceEntity>> devicesFetchCompleter = Completer();

void main() async {
  final locator = GetIt();
  await initModules(locator);
  final logoController = LogoSiemensController();

  final devicesController = IDevicesController.create(
    repository: locator.get(),
    projectId: -1,
  );

  locator.registerSingleton(devicesController);

  fetchDevices(devicesController: devicesController);

  await devicesFetchCompleter.future;

  final deviceStateChangeHandler = locator.get<DeviceStateChangeHandler>();
  final inOutScenarioExecutor = locator.get<InOutScenarioExecutorService>();

  inOutScenarioExecutor.changeDeviceListeners.add((action) async {
    final device = devicesController.state.data!.firstWhereOrNull(
      (d) => d.providerDeviceId == action.deviceId,
    );
    if (device == null) return;
    final newState = switch (action.state) {
      true => true,
      false => false,
      null =>
        !((device.capabilities
                        .firstWhereOrNull(
                          (capability) =>
                              capability.state is DeviceCapabilityStateOnEntity,
                        )
                        ?.state
                    as DeviceCapabilityStateOnEntity?)
                ?.value ==
            true),
    };
    await logoController.updateState(
      device.providerDeviceId!,
      newState ? [1] : [0],
    );
  });

  final eventsController = locator.get<IEventsRepository>();

  logoController.connect(mqttHost: mqttHost, mqttHostPort: mqttHostPort);

  logoController.changedStateStream.listen((state) async {
    final newState = state.value[0] == 1;
    deviceStateChangeHandler.handleDeviceStateChange(
      deviceId: state.id,
      newState: newState,
    );
    final device = devicesController.state.data!.firstWhereOrNull(
      (d) => d.providerDeviceId == state.id,
    );
    if (device == null) return;
    eventsController.sendMessages(
      messages: [
        EventMessageInputEntity.deviceCapabilitiesChanged(
          capabilities: [
            DeviceCapabilityEntity.onOff(
              state: DeviceCapabilityStateEntity.on(value: newState),
              parameters: null,
            ),
          ],
          deviceId: device.id,
        ),
      ],
    );
  });

  eventsController.onEvents.listen((events) async {
    for (final event in events) {
      event.mapOrNull(
        needDeviceCapabilitiesChange: (event) async {
          final device = devicesController.state.data!.firstWhereOrNull(
            (d) => d.id == event.deviceId,
          );
          if (device?.providerType == DeviceProviderType.logoSiemens &&
              device?.providerDeviceId != null) {
            final onOffCapability = event.capabilities.firstWhereOrNull(
              (capability) => capability.state is DeviceCapabilityStateOnEntity,
            );
            final deviceState =
                (device!.capabilities
                        .firstWhereOrNull(
                          (capability) =>
                              capability.state is DeviceCapabilityStateOnEntity,
                        )
                        ?.state
                    as DeviceCapabilityStateOnEntity?);
            if (onOffCapability == null) return;
            await logoController.updateState(
              device.providerDeviceId!,
              (onOffCapability.state as DeviceCapabilityStateOnEntity).value ??
                      (deviceState?.value == true ? false : true)
                  ? [1]
                  : [0],
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
  await InOutScenariosModule.init(locator: locator);
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

import 'dart:async';
import 'dart:io';

import 'package:common/common.dart';
import 'package:device_scenarios/device_scenarios.dart';
import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:inout_scenarios/inout_scenarios.dart';

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

  // final inputStateChangeHandler = locator.get<InputStateChangeHandler>();
  // final outputStateChangeHandler = locator.get<OutputStateChangeHandler>();

  final deviceStateChangeHandler = locator.get<DeviceStateChangeHandler>();
  // final input2StateChangeHandler = locator.get<Input2StateChangeHandler>();

  final deviceScenariosRepository = locator.get<IDeviceScenariosRepository>();
  final deviceExecutorService = locator.get<DeviceScenarioExecutorService>();

  eventsController.onEvents.listen((events) async {
    for (final event in events) {
      event.mapOrNull(
        deviceStateChanged: (event) {
          deviceStateChangeHandler.handleDeviceStateChange(
            deviceId: event.deviceId,
            newDeviceCapabilities: event.deviceCapabilities,
            newDeviceProperties: event.deviceProperties,
          );
        },
        needRunDeviceScenario: (event) async {
          final scenario = await deviceScenariosRepository.fetch(
              id: event.scenarioId, projectId: -1);
          if (scenario != null) {
            await deviceExecutorService.executeScenario(scenario);
          } else {
            print('Device scenario not found: ${event.scenarioId}');
          }
        },
      );
    }
  });

  // locator
  //     .get<InOutScenarioExecutorService>()
  //     .changeOutputListeners
  //     .add((output) async {
  //   if (syncServiceWebSocket?.readyState != WebSocket.open) return;
  //   try {
  //     syncServiceWebSocket?.add(
  //       jsonEncode(
  //         [
  //           {
  //             'type': 'needOutputChange',
  //             'outputId': output.outputId,
  //             'isOn': output.state,
  //           }
  //         ],
  //       ),
  //     );
  //   } catch (e) {
  //     print('Error handling output change: $e');
  //   }
  // });

  deviceExecutorService.changeDeviceStateListeners.add((action) async {
    try {
      if (action.state.mapOrNull(on: (_) => true) ?? false) {
        var state = action.state;
        if (action.state.maybeMap(
            orElse: () => false, on: (state) => state.value == null)) {
          final device = devicesController.state.data!.firstWhereOrNull(
            (d) => d.id == action.deviceId,
          );
          if (device == null) return;
          final onOffCapability = device.capabilities.firstWhere(
            (capability) =>
                capability.maybeMap(orElse: () => false, onOff: (_) => true),
          );
          state = DeviceCapabilityStateOnEntity(
            value: onOffCapability.state?.maybeMap(
                orElse: () => false,
                on: (state) => (state.value ?? true) ? false : true),
          );
        }
        eventsController.sendMessages(messages: [
          EventMessageInputEntity.needDeviceCapabilitiesChange(
            capabilities: [
              DeviceCapabilityEntity.onOff(
                state: state,
                parameters: null,
              ),
            ],
            deviceId: action.deviceId,
          )
        ]);
      } else {
        final capability = action.state.mapOrNull(
          hsv: (state) => DeviceCapabilityEntity.colorSetting(
            state: state,
            parameters: null,
          ),
          rgb: (value) => DeviceCapabilityEntity.colorSetting(
            state: value,
            parameters: null,
          ),
          temperatureK: (value) => DeviceCapabilityEntity.colorSetting(
            state: value,
            parameters: null,
          ),
          scene: (value) => DeviceCapabilityEntity.colorSetting(
            state: value,
            parameters: null,
          ),
          brightness: (value) => DeviceCapabilityEntity.range(
            state: value,
            parameters: null,
          ),
          channel: (value) => DeviceCapabilityEntity.range(
            state: value,
            parameters: null,
          ),
          volume: (value) => DeviceCapabilityEntity.range(
            state: value,
            parameters: null,
          ),
          temperature: (value) => DeviceCapabilityEntity.range(
            state: value,
            parameters: null,
          ),
          open: (state) => DeviceCapabilityEntity.range(
            state: state,
            parameters: null,
          ),
          humidity: (value) => DeviceCapabilityEntity.range(
            state: value,
            parameters: null,
          ),
        );
        if (capability != null) {
          eventsController.sendMessages(messages: [
            EventMessageInputEntity.needDeviceCapabilitiesChange(
              capabilities: [
                capability,
              ],
              deviceId: action.deviceId,
            )
          ]);
        }
      }
    } catch (e) {
      print('Error handling device state change: $e');
    }
  });

  // print('Received message: $event');
  // final events = jsonDecode(event);
  // if (events is List) {
  //   for (final event in events) {
  //     if (event['type'] == 'inputChanged') {
  //       print('Input changed: ${event['inputId']}');

  //       inputStateChangeHandler.handleInputStateChange(
  //         inputId: event['inputId'],
  //         newState: event['state'],
  //       );
  //       input2StateChangeHandler.handleInputStateChange(
  //         inputId: event['inputId'],
  //         newState: event['state'],
  //       );
  //     } else if (event['type'] == 'outputChanged') {
  //       print('Output changed: ${event['outputId']}');

  //       outputStateChangeHandler.handleOutputStateChange(
  //         outputId: event['outputId'],
  //         newState: event['state'],
  //       );
  //     } else if (event['type'] == 'deviceStateChanged') {
  //       print('Device state changed: ${event['deviceId']}');

  //       deviceStateChangeHandler.handleDeviceStateChange(
  //         deviceId: event['deviceId'],
  //         newDeviceCapabilities: event['deviceCapabilities'],
  //         newDeviceProperties: event['deviceProperties'],
  //       );
  //     } else if (event['type'] == 'needRunDeviceScenario') {
  //       final deviceScenarioId = event['scenarioId'];
  //       final scenario = await locator
  //           .get<IDeviceScenariosRepository>()
  //           .fetch(id: deviceScenarioId);
  //       if (scenario != null) {
  //         await locator
  //             .get<DeviceScenarioExecutorService>()
  //             .executeScenario(scenario);
  //       } else {
  //         print('Device scenario not found: $deviceScenarioId');
  //       }
  //     }
  //   }
  // }
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
  await DeviceScenariosModule.init(locator: locator);
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

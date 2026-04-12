import 'package:device_scenarios/src/domain/domain.dart';

class DeviceScenarioExecutorService {
  List<Function(ActionChangeDeviceStateEntity)> changeDeviceStateListeners = [];

  Future<void> executeScenario(DeviceScenarioEntity scenario) async {
    for (var action in scenario.actions) {
      await _executeAction(action);
    }
  }

  Future<void> _executeAction(ActionEntity action) async {
    print('Executing action: $action');
    await action.map(
      changeDeviceState: (action) async {
        for (var listener in changeDeviceStateListeners) {
          listener(action);
        }
      },
      delay: (delayAction) async {
        await Future.delayed(Duration(seconds: delayAction.seconds));
      },
    );
  }
}

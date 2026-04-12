import 'package:inout_scenarios/src/domain/domain.dart';

class InOutScenarioExecutorService {
  List<Function(ActionChangeDeviceEntity)> changeDeviceListeners = [];

  Future<void> executeScenario(InOutScenarioEntity scenario) async {
    for (var action in scenario.actions) {
      await _executeAction(action);
    }
  }

  Future<void> _executeAction(ActionEntity action) async {
    print('Executing action: $action');
    await action.map(
      changeDevice: (changeDeviceAction) async {
        for (var listener in changeDeviceListeners) {
          listener(changeDeviceAction);
        }
      },
      delay: (delayAction) async {
        await Future.delayed(Duration(seconds: delayAction.seconds));
      },
    );
  }
}

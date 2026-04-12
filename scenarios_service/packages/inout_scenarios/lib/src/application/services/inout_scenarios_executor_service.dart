import 'package:inout_scenarios/src/domain/domain.dart';

class InOutScenarioExecutorService {
  List<Function(ActionChangeOutputEntity)> changeOutputListeners = [];

  Future<void> executeScenario(InOutScenarioEntity scenario) async {
    for (var action in scenario.actions) {
      await _executeAction(action);
    }
  }

  Future<void> _executeAction(ActionEntity action) async {
    print('Executing action: $action');
    await action.map(
      changeOutput: (changeOutputAction) async {
        for (var listener in changeOutputListeners) {
          listener(changeOutputAction);
        }
      },
      delay: (delayAction) async {
        await Future.delayed(Duration(seconds: delayAction.seconds));
      },
    );
  }
}

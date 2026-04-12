import 'package:inout_scenarios/src/application/application.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

class InputStateChangeHandler {
  final IInOutScenariosRepository _scenarioRepository;
  final InOutScenarioExecutorService _executorService;

  InputStateChangeHandler({
    required IInOutScenariosRepository scenarioRepository,
    required InOutScenarioExecutorService executorService,
  })  : _scenarioRepository = scenarioRepository,
        _executorService = executorService;

  List<Function(ActionChangeOutputEntity)> get changeOutputListeners =>
      _executorService.changeOutputListeners;

  Future<void> handleInputStateChange({
    required int inputId,
    required bool newState,
  }) async {
    // Получаем все сценарии
    final scenarios = await _scenarioRepository.fetchAll();

    // Фильтруем сценарии, которые зависят от изменения состояния входа
    final relevantScenarios = scenarios.where((scenario) {
      return _checkCondition(
        condition: scenario.condition,
        inputId: inputId,
        newState: newState,
      );
    }).toList();

    // Выполняем релевантные сценарии
    for (var scenario in relevantScenarios) {
      await _executorService.executeScenario(scenario);
    }
  }

  bool _checkCondition({
    required ConditionEntity condition,
    required int inputId,
    required bool newState,
  }) {
    return condition.map(
      logic: (logicCondition) {
        switch (logicCondition.logic) {
          case ConditionLogicType.and:
            return logicCondition.conditions.every((subCondition) {
              return _checkCondition(
                condition: subCondition,
                inputId: inputId,
                newState: newState,
              );
            });
          case ConditionLogicType.or:
            return logicCondition.conditions.any((subCondition) {
              return _checkCondition(
                condition: subCondition,
                inputId: inputId,
                newState: newState,
              );
            });
        }
      },
      state: (stateCondition) {
        return _isRelevantCondition(
          condition: stateCondition,
          inputId: inputId,
          newState: newState,
        );
      },
    );
  }

  bool _isRelevantCondition({
    required ConditionEntity condition,
    required int inputId,
    required bool newState,
  }) {
    return condition.map(
      logic: (logicCondition) {
        return logicCondition.conditions.any((subCondition) {
          return _isRelevantCondition(
            condition: subCondition,
            inputId: inputId,
            newState: newState,
          );
        });
      },
      state: (stateCondition) {
        // Проверяем, относится ли условие к изменению состояния входа
        return stateCondition.inputId == inputId &&
            switch (stateCondition.state) {
              ConditionStateType.on => newState,
              ConditionStateType.off => !newState,
              ConditionStateType.change => true,
            };
      },
    );
  }
}

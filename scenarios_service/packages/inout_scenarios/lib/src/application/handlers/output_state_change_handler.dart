import 'package:inout_scenarios/src/application/application.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

class OutputStateChangeHandler {
  final IInOutScenariosRepository _scenarioRepository;
  final InOutScenarioExecutorService _executorService;

  OutputStateChangeHandler({
    required IInOutScenariosRepository scenarioRepository,
    required InOutScenarioExecutorService executorService,
  })  : _scenarioRepository = scenarioRepository,
        _executorService = executorService;

  Future<void> handleOutputStateChange({
    required int outputId,
    required bool newState,
  }) async {
    // Получаем все сценарии
    final scenarios = await _scenarioRepository.fetchAll();

    // Фильтруем сценарии, которые зависят от изменения состояния выхода
    final relevantScenarios = scenarios.where((scenario) {
      return _checkCondition(
        condition: scenario.condition,
        outputId: outputId,
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
    required int outputId,
    required bool newState,
  }) {
    return condition.map(
      logic: (logicCondition) {
        switch (logicCondition.logic) {
          case ConditionLogicType.and:
            return logicCondition.conditions.every((subCondition) {
              return _checkCondition(
                condition: subCondition,
                outputId: outputId,
                newState: newState,
              );
            });
          case ConditionLogicType.or:
            return logicCondition.conditions.any((subCondition) {
              return _checkCondition(
                condition: subCondition,
                outputId: outputId,
                newState: newState,
              );
            });
        }
      },
      state: (stateCondition) {
        return _isRelevantCondition(
          condition: stateCondition,
          outputId: outputId,
          newState: newState,
        );
      },
    );
  }

  bool _isRelevantCondition({
    required ConditionEntity condition,
    required int outputId,
    required bool newState,
  }) {
    return condition.map(
      logic: (logicCondition) {
        return logicCondition.conditions.any((subCondition) {
          return _isRelevantCondition(
            condition: subCondition,
            outputId: outputId,
            newState: newState,
          );
        });
      },
      state: (stateCondition) {
        // Проверяем, относится ли условие к изменению состояния выхода
        return stateCondition.outputId == outputId &&
            stateCondition.state == newState;
      },
    );
  }
}

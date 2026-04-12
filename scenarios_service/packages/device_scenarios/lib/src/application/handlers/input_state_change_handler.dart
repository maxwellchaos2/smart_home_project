import 'package:device_scenarios/src/application/services/services.dart';
import 'package:device_scenarios/src/domain/domain.dart';

class Input2StateChangeHandler {
  final IDeviceScenariosRepository _scenarioRepository;
  final DeviceScenarioExecutorService _executorService;

  Input2StateChangeHandler({
    required IDeviceScenariosRepository scenarioRepository,
    required DeviceScenarioExecutorService executorService,
  })  : _scenarioRepository = scenarioRepository,
        _executorService = executorService;

  List<Function(ActionChangeDeviceStateEntity)>
      get changeDeviceStateListeners =>
          _executorService.changeDeviceStateListeners;

  Future<void> handleInputStateChange({
    required int inputId,
    required bool newState,
  }) async {
    // Получаем все сценарии
    final scenarios = await _scenarioRepository.fetchAll(projectId: -1);

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
      deviceState: (stateCondition) {
        return _isRelevantCondition(
          condition: stateCondition,
          inputId: inputId,
          newState: newState,
        );
      },
      inputState: (stateCondition) {
        return _isRelevantCondition(
          condition: stateCondition,
          inputId: inputId,
          newState: newState,
        );
      },
      deviceEvent: (eventCondition) => false,
      deviceStateValue: (stateCondition) => false,
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
      inputState: (stateCondition) {
        // Проверяем, относится ли условие к изменению состояния входа

        return stateCondition.inputId == inputId &&
            switch (stateCondition.state) {
              ConditionInputStateType.on => newState,
              ConditionInputStateType.off => !newState,
              ConditionInputStateType.change => true,
            };
      },
      deviceState: (stateCondition) {
        // Проверяем, относится ли условие к изменению состояния устройства
        return false;
      },
      deviceEvent: (eventCondition) => false,
      deviceStateValue: (stateCondition) => false,
    );
  }
}

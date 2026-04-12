import 'package:inout_scenarios/src/application/application.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

class DeviceStateChangeHandler {
  final IInOutScenariosRepository _scenarioRepository;
  final InOutScenarioExecutorService _executorService;

  DeviceStateChangeHandler({
    required IInOutScenariosRepository scenarioRepository,
    required InOutScenarioExecutorService executorService,
  })  : _scenarioRepository = scenarioRepository,
        _executorService = executorService;

  List<Function(ActionChangeDeviceEntity)> get changeDeviceListeners =>
      _executorService.changeDeviceListeners;

  List<InOutScenarioEntity>? _cachedScenarios;

  Future<void> handleDeviceStateChange({
    required String deviceId,
    required bool newState,
  }) async {
    // Получаем все сценарии
    if (_cachedScenarios == null) {
      _cachedScenarios = await _scenarioRepository.fetchAll();
    } else {
      _scenarioRepository.fetchAll().then((scenarios) {
        _cachedScenarios = scenarios;
      });
    }

    // Фильтруем сценарии, которые зависят от изменения состояния входа
    final relevantScenarios = _cachedScenarios!.where((scenario) {
      return _checkCondition(
        condition: scenario.condition,
        deviceId: deviceId,
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
    required String deviceId,
    required bool newState,
  }) {
    return condition.map(
      logic: (logicCondition) {
        switch (logicCondition.logic) {
          case ConditionLogicType.and:
            return logicCondition.conditions.every((subCondition) {
              return _checkCondition(
                condition: subCondition,
                deviceId: deviceId,
                newState: newState,
              );
            });
          case ConditionLogicType.or:
            return logicCondition.conditions.any((subCondition) {
              return _checkCondition(
                condition: subCondition,
                deviceId: deviceId,
                newState: newState,
              );
            });
        }
      },
      state: (stateCondition) {
        return _isRelevantCondition(
          condition: stateCondition,
          deviceId: deviceId,
          newState: newState,
        );
      },
    );
  }

  bool _isRelevantCondition({
    required ConditionEntity condition,
    required String deviceId,
    required bool newState,
  }) {
    return condition.map(
      logic: (logicCondition) {
        return logicCondition.conditions.any((subCondition) {
          return _isRelevantCondition(
            condition: subCondition,
            deviceId: deviceId,
            newState: newState,
          );
        });
      },
      state: (stateCondition) {
        // Проверяем, относится ли условие к изменению состояния входа
        return stateCondition.deviceId == deviceId &&
            switch (stateCondition.state) {
              ConditionStateType.on => newState,
              ConditionStateType.off => !newState,
              ConditionStateType.change => true,
            };
      },
    );
  }
}

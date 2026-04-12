import 'package:device_scenarios/src/application/services/services.dart';
import 'package:device_scenarios/src/domain/domain.dart';
import 'package:devices/devices.dart';

class DeviceStateChangeHandler {
  final IDeviceScenariosRepository _scenarioRepository;
  final DeviceScenarioExecutorService _executorService;

  DeviceStateChangeHandler({
    required IDeviceScenariosRepository scenarioRepository,
    required DeviceScenarioExecutorService executorService,
  })  : _scenarioRepository = scenarioRepository,
        _executorService = executorService;

  List<Function(ActionChangeDeviceStateEntity)>
      get changeDeviceStateListeners =>
          _executorService.changeDeviceStateListeners;

  Future<void> handleDeviceStateChange({
    required int deviceId,
    required List<DeviceCapabilityEntity>? newDeviceCapabilities,
    required List<DevicePropertyEntity>? newDeviceProperties,
  }) async {
    // Получаем все сценарии
    final scenarios = await _scenarioRepository.fetchAll(projectId: -1);

    for (final capability
        in newDeviceCapabilities ?? <DeviceCapabilityEntity>[]) {
      if (capability.state == null) {
        continue; // Пропускаем, если состояние не задано
      }
      // Фильтруем сценарии, которые зависят от изменения состояния входа
      final relevantScenarios = scenarios.where((scenario) {
        return _checkCondition(
          condition: scenario.condition,
          deviceId: deviceId,
          newState: capability.state!,
        );
      }).toList();

      // Выполняем релевантные сценарии
      for (var scenario in relevantScenarios) {
        await _executorService.executeScenario(scenario);
      }
    }

    for (final property in newDeviceProperties ?? <DevicePropertyEntity>[]) {
      if (property.state == null) {
        continue; // Пропускаем, если состояние не задано
      }
      if (property is DevicePropertyEventEntity) {
        final relevantScenarios = scenarios.where((scenario) {
          return _checkEventCondition(
            condition: scenario.condition,
            deviceId: deviceId,
            newState: property.state!,
          );
        }).toList();

        // Выполняем релевантные сценарии
        for (var scenario in relevantScenarios) {
          await _executorService.executeScenario(scenario);
        }
      }
      if (property is DevicePropertyFloatEntity) {
        final relevantScenarios = scenarios.where((scenario) {
          return _checkCondition(
            condition: scenario.condition,
            deviceId: deviceId,
            newState: property.state!,
          );
        }).toList();

        // Выполняем релевантные сценарии
        for (var scenario in relevantScenarios) {
          await _executorService.executeScenario(scenario);
        }
      }
    }
  }

  bool _checkCondition({
    required ConditionEntity condition,
    required int deviceId,
    required DeviceCapabilityStateEntity newState,
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
      deviceState: (stateCondition) {
        final result = _isRelevantCondition(
          condition: stateCondition,
          deviceId: deviceId,
          newState: newState,
        );
        return result;
      },
      deviceStateValue: (stateCondition) {
        if (newState.maybeMap(unknown: (value) => true, orElse: () => false) ||
            (newState as dynamic).value is! num) {
          return false;
        }
        final conditionValue = (stateCondition.state as dynamic).value as num;
        final newValue = (newState as dynamic).value as num;

        return stateCondition.deviceId == deviceId &&
            switch (stateCondition.operator) {
              ConditionOperator.equal => (conditionValue == newValue),
              ConditionOperator.notEqual => conditionValue != newValue,
              ConditionOperator.greaterThan => (newValue > conditionValue),
              ConditionOperator.lessThan => (newValue < conditionValue),
            };
      },
      inputState: (stateCondition) {
        return _isRelevantCondition(
          condition: stateCondition,
          deviceId: deviceId,
          newState: newState,
        );
      },
      deviceEvent: (eventCondition) => false, // События не обрабатываются здесь
    );
  }

  bool _checkEventCondition({
    required ConditionEntity condition,
    required int deviceId,
    required Map<String, dynamic> newState,
  }) {
    return condition.map(
      logic: (logicCondition) {
        switch (logicCondition.logic) {
          case ConditionLogicType.and:
            return logicCondition.conditions.every((subCondition) {
              return _checkEventCondition(
                condition: subCondition,
                deviceId: deviceId,
                newState: newState,
              );
            });
          case ConditionLogicType.or:
            return logicCondition.conditions.any((subCondition) {
              return _checkEventCondition(
                condition: subCondition,
                deviceId: deviceId,
                newState: newState,
              );
            });
        }
      },
      deviceState: (value) => false,
      deviceStateValue: (value) => false,
      inputState: (value) => false,
      deviceEvent: (eventCondition) {
        // Проверяем, относится ли условие к изменению события устройства
        return eventCondition.deviceId == deviceId &&
            newState['instance'] == eventCondition.event.key &&
            (eventCondition.event.value == null ||
                newState['value'] == eventCondition.event.value);
      },
    );
  }

  bool _isRelevantCondition({
    required ConditionEntity condition,
    required int deviceId,
    required DeviceCapabilityStateEntity newState,
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
      inputState: (stateCondition) {
        // Проверяем, относится ли условие к изменению состояния входа

        return false;
      },
      deviceState: (stateCondition) {
        // Проверяем, относится ли условие к изменению состояния устройства
        return stateCondition.deviceId == deviceId &&
            stateCondition.state is DeviceCapabilityStateOnEntity &&
            newState is DeviceCapabilityStateOnEntity &&
            switch (
                (stateCondition.state as DeviceCapabilityStateOnEntity).value) {
              null => true,
              true => newState.value == true,
              false => newState.value == false,
            };
      },
      deviceEvent: (eventCondition) => false, // События не обрабатываются здесь
      deviceStateValue: (stateCondition) =>
          false, // Значения состояния не обрабатываются здесь
    );
  }
}

import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/domain/domain.dart';
import 'package:devices/devices.dart';

abstract final class ConditionRequestMapper {
  static ConditionEntity toEntity({required ConditionRequestModel from}) {
    return from.map(
      logic: (from) => ConditionEntity.logic(
        logic: switch (from.logic) {
          'and' => ConditionLogicType.and,
          'or' => ConditionLogicType.or,
          _ => throw Exception('Unknown logic type: ${from.logic}'),
        },
        conditions: from.conditions
            .map((from) => ConditionRequestMapper.toEntity(from: from))
            .toList(),
      ),
      inputState: (from) => ConditionEntity.inputState(
        inputId: from.inputId,
        state: switch (from.state) {
          true => ConditionInputStateType.on,
          false => ConditionInputStateType.off,
          null => ConditionInputStateType.change,
        },
      ),
      deviceState: (from) => ConditionEntity.deviceState(
        deviceId: from.deviceId,
        state: DeviceCapabilityStateEntity.fromJson(from.state),
      ),
      deviceStateValue: (from) => ConditionEntity.deviceStateValue(
        deviceId: from.deviceId,
        state: DeviceCapabilityStateEntity.fromJson(from.state),
        operator: switch (from.operator) {
          'equal' => ConditionOperator.equal,
          'notEqual' => ConditionOperator.notEqual,
          'greaterThan' => ConditionOperator.greaterThan,
          'lessThan' => ConditionOperator.lessThan,
          _ => throw Exception('Unknown operator type: ${from.operator}'),
        },
      ),
      deviceEvent: (from) => ConditionEntity.deviceEvent(
        deviceId: from.deviceId,
        event: (key: from.event['key'] as String, value: from.event['value']),
      ),
    );
  }
}

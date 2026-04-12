import 'package:devices/devices.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class ConditionMapper {
  static ConditionEntity toEntity({required ConditionModel from}) {
    return from.map(
      logic: (from) => ConditionEntity.logic(
        logic: switch (from.logic) {
          'and' => ConditionLogicType.and,
          'or' => ConditionLogicType.or,
          _ => throw Exception('Unknown logic type: ${from.logic}'),
        },
        conditions: from.conditions
            .map((from) => ConditionMapper.toEntity(from: from))
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
        event: (
          key: from.event['key'] as String,
          value: from.event['value'] as String?
        ),
      ),
    );
  }

  static ConditionModel toModel({required ConditionEntity from}) {
    return from.map(
      logic: (from) => ConditionModel.logic(
        logic: switch (from.logic) {
          ConditionLogicType.and => 'and',
          ConditionLogicType.or => 'or',
        },
        conditions: from.conditions
            .map((from) => ConditionMapper.toModel(from: from))
            .toList(),
      ),
      inputState: (from) => ConditionModel.inputState(
        inputId: from.inputId,
        state: switch (from.state) {
          ConditionInputStateType.on => true,
          ConditionInputStateType.off => false,
          ConditionInputStateType.change => null,
        },
      ),
      deviceState: (value) => ConditionModel.deviceState(
        deviceId: value.deviceId,
        state: value.state.toJson(),
      ),
      deviceStateValue: (from) => ConditionModel.deviceStateValue(
        deviceId: from.deviceId,
        state: from.state.toJson(),
        operator: switch (from.operator) {
          ConditionOperator.equal => 'equal',
          ConditionOperator.notEqual => 'notEqual',
          ConditionOperator.greaterThan => 'greaterThan',
          ConditionOperator.lessThan => 'lessThan',
        },
      ),
      deviceEvent: (from) => ConditionModel.deviceEvent(
        deviceId: from.deviceId,
        event: {
          'key': from.event.key,
          'value': from.event.value,
        },
      ),
    );
  }
}

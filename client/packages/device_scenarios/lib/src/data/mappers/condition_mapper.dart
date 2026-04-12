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
          _ => throw UnimplementedError(),
        },
        conditions: from.conditions.map((e) => toEntity(from: e)).toList(),
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
      deviceEvent: (from) => ConditionEntity.deviceEvent(
        deviceId: from.deviceId,
        event: (key: from.event['key']!, value: from.event['value']),
      ),
      deviceStateValue: (from) => ConditionEntity.deviceStateValue(
        deviceId: from.deviceId,
        state: DeviceCapabilityStateEntity.fromJson(from.state),
        operator: switch (from.operator) {
          'equal' => ConditionOperator.equal,
          'notEqual' => ConditionOperator.notEqual,
          'greaterThan' => ConditionOperator.greaterThan,
          'lessThan' => ConditionOperator.lessThan,
          _ => throw UnimplementedError(),
        },
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
        conditions: from.conditions.map((e) => toModel(from: e)).toList(),
      ),
      inputState: (from) => ConditionModel.inputState(
        inputId: from.inputId,
        state: switch (from.state) {
          ConditionInputStateType.on => true,
          ConditionInputStateType.off => false,
          ConditionInputStateType.change => null,
        },
      ),
      deviceEvent: (from) => ConditionModel.deviceEvent(
        deviceId: from.deviceId,
        event: {
          'key': from.event.key,
          'value': from.event.value,
        },
      ),
      deviceState: (from) => ConditionModel.deviceState(
        deviceId: from.deviceId,
        state: from.state.toJson(),
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
    );
  }
}

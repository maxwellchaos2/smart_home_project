import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/domain/domain.dart';

abstract final class ConditionResponseMapper {
  static ConditionResponseModel toModel({required ConditionEntity from}) {
    return from.map(
      logic: (from) => ConditionResponseModel.logic(
        logic: switch (from.logic) {
          ConditionLogicType.and => 'and',
          ConditionLogicType.or => 'or',
        },
        conditions: from.conditions
            .map((from) => ConditionResponseMapper.toModel(from: from))
            .toList(),
      ),
      inputState: (from) => ConditionResponseModel.inputState(
        inputId: from.inputId,
        state: switch (from.state) {
          ConditionInputStateType.on => true,
          ConditionInputStateType.off => false,
          ConditionInputStateType.change => null,
        },
      ),
      deviceState: (from) => ConditionResponseModel.deviceState(
        deviceId: from.deviceId,
        state: from.state.toJson(),
      ),
      deviceEvent: (from) => ConditionResponseModel.deviceEvent(
        deviceId: from.deviceId,
        event: {
          'key': from.event.key,
          'value': from.event.value,
        },
      ),
      deviceStateValue: (from) => ConditionResponseModel.deviceStateValue(
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

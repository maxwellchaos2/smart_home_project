import 'package:inout_scenario/src/application/models/models.dart';
import 'package:inout_scenario/src/domain/domain.dart';

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
      state: (from) => ConditionResponseModel.state(
        deviceId: from.deviceId,
        state: switch (from.state) {
          ConditionStateType.on => true,
          ConditionStateType.off => false,
          ConditionStateType.change => null,
        },
      ),
    );
  }
}

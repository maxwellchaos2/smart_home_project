import 'package:inout_scenario/src/application/models/models.dart';
import 'package:inout_scenario/src/domain/domain.dart';

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
      state: (from) => ConditionEntity.state(
        deviceId: from.deviceId,
        state: switch (from.state) {
          true => ConditionStateType.on,
          false => ConditionStateType.off,
          null => ConditionStateType.change,
        },
      ),
    );
  }
}

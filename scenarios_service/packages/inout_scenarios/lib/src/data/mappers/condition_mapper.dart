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
      state: (from) => ConditionEntity.state(
        outputId: from.outputId,
        inputId: from.inputId,
        state: switch (from.state) {
          true => ConditionStateType.on,
          false => ConditionStateType.off,
          null => ConditionStateType.change,
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
      state: (from) => ConditionModel.state(
        outputId: from.outputId,
        inputId: from.inputId,
        state: switch (from.state) {
          ConditionStateType.on => true,
          ConditionStateType.off => false,
          ConditionStateType.change => null,
        },
      ),
    );
  }
}

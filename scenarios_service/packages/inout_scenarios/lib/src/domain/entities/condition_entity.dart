import 'package:common/common.dart';

part 'condition_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ConditionEntity with _$ConditionEntity {
  const ConditionEntity._();

  const factory ConditionEntity.logic({
    required ConditionLogicType logic,
    required List<ConditionEntity> conditions,
  }) = ConditionLogicEntity;

  @Assert('inputId != null || outputId != null')
  const factory ConditionEntity.state({
    int? inputId,
    int? outputId,
    required ConditionStateType state,
  }) = ConditionStateEntity;
}

enum ConditionLogicType {
  and,
  or,
}

enum ConditionStateType {
  on,
  off,
  change,
}

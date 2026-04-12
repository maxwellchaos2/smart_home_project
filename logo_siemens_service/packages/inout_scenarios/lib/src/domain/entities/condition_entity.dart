import 'package:common/common.dart';

part 'condition_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ConditionEntity with _$ConditionEntity {
  const ConditionEntity._();

  const factory ConditionEntity.logic({
    required ConditionLogicType logic,
    required List<ConditionEntity> conditions,
  }) = ConditionLogicEntity;

  const factory ConditionEntity.state({
    required String deviceId,
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

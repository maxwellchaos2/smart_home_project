import 'package:common/common.dart';

part 'action_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ActionEntity with _$ActionEntity {
  const ActionEntity._();

  const factory ActionEntity.changeOutput({
    required int outputId,
    required bool? state,
  }) = ActionChangeOutputEntity;

  const factory ActionEntity.delay({
    required int seconds,
  }) = ActionDelayEntity;
}

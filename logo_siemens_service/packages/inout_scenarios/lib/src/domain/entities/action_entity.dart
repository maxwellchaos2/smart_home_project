import 'package:common/common.dart';

part 'action_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ActionEntity with _$ActionEntity {
  const ActionEntity._();

  const factory ActionEntity.changeDevice({
    required String deviceId,
    required bool? state,
  }) = ActionChangeDeviceEntity;

  const factory ActionEntity.delay({
    required int seconds,
  }) = ActionDelayEntity;
}

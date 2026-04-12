import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'action_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ActionEntity with _$ActionEntity {
  const ActionEntity._();

  const factory ActionEntity.changeDeviceState({
    required int deviceId,
    required DeviceCapabilityStateEntity state,
  }) = ActionChangeDeviceStateEntity;

  const factory ActionEntity.delay({
    required int seconds,
  }) = ActionDelayEntity;
}

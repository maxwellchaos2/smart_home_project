import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'action_model.freezed.dart';
part 'action_model.g.dart';

@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class ActionModel with _$ActionModel {
  const ActionModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ActionModel.changeDeviceState({
    required int deviceId,
    required DeviceCapabilityStateEntity state,
  }) = _ActionChangeDeviceStateModel;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ActionModel.delay({
    required int seconds,
  }) = _ActionDelayModel;

  factory ActionModel.fromJson(Map<String, Object?> json) =>
      _$ActionModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

import 'package:common/common.dart';

part 'action_model.freezed.dart';
part 'action_model.g.dart';

@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class ActionModel with _$ActionModel {
  const ActionModel._();

  const factory ActionModel.changeDeviceState({
    required int deviceId,
    required Map<String, dynamic> state,
  }) = _ActionChangeDeviceStateModel;

  const factory ActionModel.delay({
    required int seconds,
  }) = _ActionDelayModel;

  factory ActionModel.fromJson(Map<String, Object?> json) =>
      _$ActionModelFromJson(json);

  @override
  Map<String, Object?> toJson();
}

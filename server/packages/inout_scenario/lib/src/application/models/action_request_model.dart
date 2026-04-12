import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_request_model.freezed.dart';
part 'action_request_model.g.dart';

@Freezed(fromJson: true, unionKey: 'type')
class ActionRequestModel with _$ActionRequestModel {
  const ActionRequestModel._();

  const factory ActionRequestModel.changeDevice({
    required String deviceId,
    required bool? state,
  }) = _ActionChangeOutputRequestModel;

  const factory ActionRequestModel.delay({
    required int seconds,
  }) = _ActionDelayRequestModel;

  factory ActionRequestModel.fromJson(Map<String, Object?> json) =>
      _$ActionRequestModelFromJson(json);
}

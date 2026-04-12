import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_response_model.freezed.dart';
part 'action_response_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
class ActionResponseModel with _$ActionResponseModel {
  const ActionResponseModel._();

  const factory ActionResponseModel.changeDeviceState({
    required int deviceId,
    required Map<String, dynamic> state,
  }) = _ActionChangeDeviceStateResponseModel;

  const factory ActionResponseModel.delay({
    required int seconds,
  }) = _ActionDelayResponseModel;

  @override
  Map<String, dynamic> toJson();
}

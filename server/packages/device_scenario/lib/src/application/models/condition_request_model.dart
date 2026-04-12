import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_request_model.freezed.dart';
part 'condition_request_model.g.dart';

@Freezed(fromJson: true, unionKey: 'type')
class ConditionRequestModel with _$ConditionRequestModel {
  const ConditionRequestModel._();

  const factory ConditionRequestModel.logic({
    required String logic,
    required List<ConditionRequestModel> conditions,
  }) = _ConditionLogicRequestModel;

  const factory ConditionRequestModel.deviceState({
    required int deviceId,
    required Map<String, dynamic> state,
  }) = ConditionDeviceStateRequestModel;

  const factory ConditionRequestModel.deviceStateValue({
    required int deviceId,
    required Map<String, dynamic> state,
    required String operator,
  }) = _ConditionDeviceStateValueRequestModel;

  const factory ConditionRequestModel.inputState({
    required int inputId,
    required bool? state,
  }) = _ConditionInputStateRequestModel;

  const factory ConditionRequestModel.deviceEvent({
    required int deviceId,
    required Map<String, dynamic> event,
  }) = _ConditionDeviceEventRequestModel;

  factory ConditionRequestModel.fromJson(Map<String, Object?> json) =>
      _$ConditionRequestModelFromJson(json);
}

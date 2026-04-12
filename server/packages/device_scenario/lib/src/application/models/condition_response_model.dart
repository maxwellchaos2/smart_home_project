import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_response_model.freezed.dart';
part 'condition_response_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
class ConditionResponseModel with _$ConditionResponseModel {
  const ConditionResponseModel._();

  const factory ConditionResponseModel.logic({
    required String logic,
    required List<ConditionResponseModel> conditions,
  }) = _ConditionLogicResponseModel;

  const factory ConditionResponseModel.inputState({
    required int inputId,
    required bool? state,
  }) = _ConditionInputStateResponseModel;

  const factory ConditionResponseModel.deviceState({
    required int deviceId,
    required Map<String, dynamic> state,
  }) = _ConditionDeviceStateResponseModel;

  const factory ConditionResponseModel.deviceStateValue({
    required int deviceId,
    required Map<String, dynamic> state,
    required String operator,
  }) = _ConditionDeviceStateValueResponseModel;

  const factory ConditionResponseModel.deviceEvent({
    required int deviceId,
    required Map<String, dynamic> event,
  }) = _ConditionDeviceEventResponseModel;

  @override
  Map<String, dynamic> toJson();
}

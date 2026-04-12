import 'package:common/common.dart';

part 'condition_model.freezed.dart';
part 'condition_model.g.dart';

@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class ConditionModel with _$ConditionModel {
  const ConditionModel._();

  const factory ConditionModel.logic({
    required String logic,
    required List<ConditionModel> conditions,
  }) = _ConditionLogicModel;

  const factory ConditionModel.deviceState({
    required int deviceId,
    required Map<String, dynamic> state,
  }) = _ConditionDeviceStateModel;

  const factory ConditionModel.deviceStateValue({
    required int deviceId,
    required Map<String, dynamic> state,
    required String operator,
  }) = _ConditionDeviceStateValueModel;

  const factory ConditionModel.deviceEvent({
    required int deviceId,
    required Map<String, String?> event,
  }) = _ConditionDeviceEventModel;

  const factory ConditionModel.inputState({
    required int inputId,
    required bool? state,
  }) = _ConditionInputStateModel;

  factory ConditionModel.fromJson(Map<String, Object?> json) =>
      _$ConditionModelFromJson(json);

  @override
  Map<String, Object?> toJson();
}

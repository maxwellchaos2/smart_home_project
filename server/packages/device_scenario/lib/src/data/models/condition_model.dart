import 'package:common/common.dart';

part 'condition_model.freezed.dart';
part 'condition_model.g.dart';

@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class ConditionModel with _$ConditionModel {
  const ConditionModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConditionModel.logic({
    required String logic,
    required List<ConditionModel> conditions,
  }) = _ConditionLogicModel;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConditionModel.deviceState({
    required int deviceId,
    required dynamic state,
  }) = _ConditionDeviceStateModel;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConditionModel.deviceStateValue({
    required int deviceId,
    required dynamic state,
    required String operator,
  }) = _ConditionDeviceStateValueModel;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConditionModel.deviceEvent({
    required int deviceId,
    required dynamic event,
  }) = _ConditionDeviceEventModel;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConditionModel.inputState({
    required int inputId,
    required bool? state,
  }) = _ConditionInputStateModel;

  factory ConditionModel.fromJson(Map<String, Object?> json) =>
      _$ConditionModelFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

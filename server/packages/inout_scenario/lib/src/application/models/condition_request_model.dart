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

  const factory ConditionRequestModel.state({
    required String deviceId,
    required bool? state,
  }) = _ConditionStateRequestModel;

  factory ConditionRequestModel.fromJson(Map<String, Object?> json) =>
      _$ConditionRequestModelFromJson(json);
}

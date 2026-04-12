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

  const factory ConditionResponseModel.state({
    required String deviceId,
    required bool? state,
  }) = _ConditionStateResponseModel;

  @override
  Map<String, dynamic> toJson();
}

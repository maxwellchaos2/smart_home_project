import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inout_scenario/src/application/models/models.dart';

part 'in_out_scenario_input_request_model.freezed.dart';
part 'in_out_scenario_input_request_model.g.dart';

@Freezed(fromJson: true)
class InOutScenarioInputRequestModel with _$InOutScenarioInputRequestModel {
  const InOutScenarioInputRequestModel._();

  const factory InOutScenarioInputRequestModel({
    required String name,
    required ConditionRequestModel condition,
    required List<ActionRequestModel> actions,
  }) = _InOutScenarioInputRequestModel;

  factory InOutScenarioInputRequestModel.fromJson(Map<String, Object?> json) =>
      _$InOutScenarioInputRequestModelFromJson(json);
}

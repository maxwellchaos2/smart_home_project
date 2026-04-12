import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inout_scenario/src/application/models/models.dart';

part 'in_out_scenario_response_model.freezed.dart';
part 'in_out_scenario_response_model.g.dart';

@Freezed(toJson: true)
class InOutScenarioResponseModel with _$InOutScenarioResponseModel {
  const InOutScenarioResponseModel._();

  const factory InOutScenarioResponseModel({
    required int id,
    required String name,
    required ConditionResponseModel condition,
    required List<ActionResponseModel> actions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _InOutScenarioResponseModel;

  @override
  Map<String, dynamic> toJson();
}

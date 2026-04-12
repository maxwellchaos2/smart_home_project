import 'package:common/common.dart';
import 'package:inout_scenarios/src/data/data.dart';

part 'in_out_scenario_model.freezed.dart';
part 'in_out_scenario_model.g.dart';

@Freezed(fromJson: true)
sealed class InOutScenarioModel with _$InOutScenarioModel {
  const InOutScenarioModel._();

  const factory InOutScenarioModel({
    required int id,
    required String name,
    required ConditionModel condition,
    required List<ActionModel> actions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _InOutScenarioModel;

  factory InOutScenarioModel.fromJson(Map<String, Object?> json) =>
      _$InOutScenarioModelFromJson(json);
}

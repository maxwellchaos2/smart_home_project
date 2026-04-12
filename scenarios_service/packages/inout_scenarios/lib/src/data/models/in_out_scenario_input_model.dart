import 'package:common/common.dart';
import 'package:inout_scenarios/src/data/data.dart';

part 'in_out_scenario_input_model.freezed.dart';
part 'in_out_scenario_input_model.g.dart';

@Freezed(toJson: true)
sealed class InOutScenarioInputModel with _$InOutScenarioInputModel {
  const InOutScenarioInputModel._();

  const factory InOutScenarioInputModel({
    required String name,
    required ConditionModel condition,
    required List<ActionModel> actions,
  }) = _InOutScenarioInputModel;

  @override
  Map<String, dynamic> toJson();
}

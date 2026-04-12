import 'package:common/common.dart';
import 'package:device_scenarios/src/data/data.dart';

part 'device_scenario_input_model.freezed.dart';
part 'device_scenario_input_model.g.dart';

@Freezed(toJson: true)
sealed class DeviceScenarioInputModel with _$DeviceScenarioInputModel {
  const DeviceScenarioInputModel._();

  const factory DeviceScenarioInputModel({
    required String name,
    required ConditionModel condition,
    required List<ActionModel> actions,
  }) = _DeviceScenarioInputModel;

  @override
  Map<String, dynamic> toJson();
}

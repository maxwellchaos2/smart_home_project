import 'package:common/common.dart';
import 'package:device_scenarios/src/data/data.dart';

part 'device_scenario_model.freezed.dart';
part 'device_scenario_model.g.dart';

@Freezed(fromJson: true)
sealed class DeviceScenarioModel with _$DeviceScenarioModel {
  const DeviceScenarioModel._();

  const factory DeviceScenarioModel({
    required int id,
    required String name,
    required ConditionModel condition,
    required List<ActionModel> actions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DeviceScenarioModel;

  factory DeviceScenarioModel.fromJson(Map<String, Object?> json) =>
      _$DeviceScenarioModelFromJson(json);
}

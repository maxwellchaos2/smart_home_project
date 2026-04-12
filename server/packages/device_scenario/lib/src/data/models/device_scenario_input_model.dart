import 'package:common/common.dart';
import 'package:device_scenario/src/data/data.dart';

part 'device_scenario_input_model.freezed.dart';
part 'device_scenario_input_model.g.dart';

@Freezed(toJson: true)
sealed class DeviceScenarioInputModel with _$DeviceScenarioInputModel {
  const DeviceScenarioInputModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DeviceScenarioInputModel({
    required String name,
    required int projectId,
    required ConditionModel condition,
    required List<ActionModel> actions,
  }) = _DeviceScenarioInputModel;

  @override
  Map<String, dynamic> toJson();
}

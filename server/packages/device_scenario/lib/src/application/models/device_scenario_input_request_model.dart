import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/application/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_scenario_input_request_model.freezed.dart';
part 'device_scenario_input_request_model.g.dart';

@Freezed(fromJson: true)
class DeviceScenarioInputRequestModel with _$DeviceScenarioInputRequestModel {
  const DeviceScenarioInputRequestModel._();

  const factory DeviceScenarioInputRequestModel({
    required String name,
    required ConditionRequestModel condition,
    required List<ActionRequestModel> actions,
  }) = _DeviceScenarioInputRequestModel;

  factory DeviceScenarioInputRequestModel.fromJson(Map<String, Object?> json) =>
      _$DeviceScenarioInputRequestModelFromJson(json);
}

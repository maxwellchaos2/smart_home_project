import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/application/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_scenario_response_model.freezed.dart';
part 'device_scenario_response_model.g.dart';

@Freezed(toJson: true)
class DeviceScenarioResponseModel with _$DeviceScenarioResponseModel {
  const DeviceScenarioResponseModel._();

  const factory DeviceScenarioResponseModel({
    required int id,
    required String name,
    required ConditionResponseModel condition,
    required List<ActionResponseModel> actions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DeviceScenarioResponseModel;

  @override
  Map<String, dynamic> toJson();
}

import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/domain/domain.dart';

abstract final class DeviceScenarioInputRequestMapper {
  static DeviceScenarioInputEntity toEntity(
      {required DeviceScenarioInputRequestModel from, required int projectId}) {
    return DeviceScenarioInputEntity(
      name: from.name,
      condition: ConditionRequestMapper.toEntity(from: from.condition),
      actions: from.actions
          .map((from) => ActionRequestMapper.toEntity(from: from))
          .toList(),
      projectId: projectId,
    );
  }
}

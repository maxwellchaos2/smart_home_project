import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/domain/domain.dart';

abstract final class DeviceScenarioResponseMapper {
  static DeviceScenarioResponseModel toModel(
      {required DeviceScenarioEntity from}) {
    return DeviceScenarioResponseModel(
      id: from.id,
      name: from.name,
      condition: ConditionResponseMapper.toModel(from: from.condition),
      actions: from.actions
          .map((from) => ActionResponseMapper.toModel(from: from))
          .toList(),
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
    );
  }
}

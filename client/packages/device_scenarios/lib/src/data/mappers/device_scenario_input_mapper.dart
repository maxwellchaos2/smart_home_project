import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class DeviceScenarioInputMapper {
  static DeviceScenarioInputModel toModel(
      {required DeviceScenarioInputEntity from}) {
    return DeviceScenarioInputModel(
      name: from.name,
      condition: ConditionMapper.toModel(from: from.condition),
      actions: from.actions.map((e) => ActionMapper.toModel(from: e)).toList(),
    );
  }
}

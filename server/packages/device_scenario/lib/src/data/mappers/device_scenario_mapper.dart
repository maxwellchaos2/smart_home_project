import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class DeviceScenarioMapper {
  static DeviceScenarioEntity toEntity({required DeviceScenarioModel from}) {
    return DeviceScenarioEntity(
      id: from.id,
      name: from.name,
      projectId: from.projectId,
      condition: ConditionMapper.toEntity(from: from.condition),
      actions: from.actions.map((e) => ActionMapper.toEntity(from: e)).toList(),
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
    );
  }
}

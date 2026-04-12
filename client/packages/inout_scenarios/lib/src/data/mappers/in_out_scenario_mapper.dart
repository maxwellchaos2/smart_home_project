import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class InOutScenarioMapper {
  static InOutScenarioEntity toEntity({required InOutScenarioModel from}) {
    return InOutScenarioEntity(
      id: from.id,
      name: from.name,
      condition: ConditionMapper.toEntity(from: from.condition),
      actions: from.actions.map((e) => ActionMapper.toEntity(from: e)).toList(),
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
    );
  }
}

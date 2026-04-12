import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class InOutScenarioInputMapper {
  static InOutScenarioInputModel toModel(
      {required InOutScenarioInputEntity from}) {
    return InOutScenarioInputModel(
      name: from.name,
      condition: ConditionMapper.toModel(from: from.condition),
      actions: from.actions.map((e) => ActionMapper.toModel(from: e)).toList(),
      projectId: from.projectId,
    );
  }
}

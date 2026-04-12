import 'package:inout_scenario/src/application/application.dart';
import 'package:inout_scenario/src/domain/domain.dart';

abstract final class InOutScenarioInputRequestMapper {
  static InOutScenarioInputEntity toEntity(
      {required InOutScenarioInputRequestModel from, required int projectId}) {
    return InOutScenarioInputEntity(
      name: from.name,
      condition: ConditionRequestMapper.toEntity(from: from.condition),
      actions: from.actions
          .map((from) => ActionRequestMapper.toEntity(from: from))
          .toList(),
      projectId: projectId,
    );
  }
}

import 'package:inout_scenario/src/application/application.dart';
import 'package:inout_scenario/src/domain/domain.dart';

abstract final class InOutScenarioResponseMapper {
  static InOutScenarioResponseModel toModel(
      {required InOutScenarioEntity from}) {
    return InOutScenarioResponseModel(
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

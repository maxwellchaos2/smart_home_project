import 'package:common/common.dart';
import 'package:inout_scenario/src/domain/domain.dart';

part 'in_out_scenario_input_entity.freezed.dart';

@freezed
sealed class InOutScenarioInputEntity with _$InOutScenarioInputEntity {
  const factory InOutScenarioInputEntity({
    required String name,
    required ConditionEntity condition,
    required List<ActionEntity> actions,
    required int projectId,
  }) = _InOutScenarioInputEntity;
}

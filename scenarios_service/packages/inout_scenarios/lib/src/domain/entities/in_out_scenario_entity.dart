import 'package:common/common.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

part 'in_out_scenario_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class InOutScenarioEntity with _$InOutScenarioEntity {
  const InOutScenarioEntity._();

  const factory InOutScenarioEntity({
    required int id,
    required String name,
    required ConditionEntity condition,
    required List<ActionEntity> actions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _InOutScenarioEntity;
}

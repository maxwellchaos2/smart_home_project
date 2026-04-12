import 'package:common/common.dart';
import 'package:device_scenarios/src/domain/domain.dart';

part 'device_scenario_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class DeviceScenarioEntity with _$DeviceScenarioEntity {
  const DeviceScenarioEntity._();

  const factory DeviceScenarioEntity({
    required int id,
    required String name,
    required ConditionEntity condition,
    required List<ActionEntity> actions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DeviceScenarioEntity;
}

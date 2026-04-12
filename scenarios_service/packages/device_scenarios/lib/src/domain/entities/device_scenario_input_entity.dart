import 'package:common/common.dart';
import 'package:device_scenarios/src/domain/domain.dart';

part 'device_scenario_input_entity.freezed.dart';

@freezed
sealed class DeviceScenarioInputEntity with _$DeviceScenarioInputEntity {
  const factory DeviceScenarioInputEntity({
    required String name,
    required ConditionEntity condition,
    required List<ActionEntity> actions,
  }) = _DeviceScenarioInputEntity;
}

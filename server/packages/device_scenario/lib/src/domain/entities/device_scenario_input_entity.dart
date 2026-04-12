import 'package:common/common.dart';
import 'package:device_scenario/src/domain/domain.dart';

part 'device_scenario_input_entity.freezed.dart';

@freezed
sealed class DeviceScenarioInputEntity with _$DeviceScenarioInputEntity {
  const factory DeviceScenarioInputEntity({
    required String name,
    required int projectId,
    required ConditionEntity condition,
    required List<ActionEntity> actions,
  }) = _DeviceScenarioInputEntity;
}

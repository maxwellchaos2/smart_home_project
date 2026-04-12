part of 'device_scenario_run_bloc.dart';

@freezed
class DeviceScenarioRunEvent with _$DeviceScenarioRunEvent {
  const factory DeviceScenarioRunEvent.run({
    required int id,
  }) = _Run;
}

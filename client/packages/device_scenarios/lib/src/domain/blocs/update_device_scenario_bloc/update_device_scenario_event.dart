part of 'update_device_scenario_bloc.dart';

@freezed
class UpdateDeviceScenarioEvent with _$UpdateDeviceScenarioEvent {
  const factory UpdateDeviceScenarioEvent.update({
    required DeviceScenarioInputEntity input,
  }) = _Update;
}

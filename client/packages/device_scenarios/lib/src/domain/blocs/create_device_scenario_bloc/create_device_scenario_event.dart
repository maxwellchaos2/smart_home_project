part of 'create_device_scenario_bloc.dart';

@freezed
class CreateDeviceScenarioEvent with _$CreateDeviceScenarioEvent {
  const factory CreateDeviceScenarioEvent.create({
    required DeviceScenarioInputEntity input,
  }) = _Create;
}

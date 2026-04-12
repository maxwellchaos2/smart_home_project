part of 'device_scenarios_bloc.dart';

@freezed
class DeviceScenariosEvent with _$DeviceScenariosEvent {
  const factory DeviceScenariosEvent.fetch() = _Fetch;

  @visibleForTesting
  const factory DeviceScenariosEvent.$changed({
    required ChangedEvent<DeviceScenarioEntity> event,
  }) = _Changed;
}

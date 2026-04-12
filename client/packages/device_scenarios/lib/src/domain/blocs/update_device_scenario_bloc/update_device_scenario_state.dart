part of 'update_device_scenario_bloc.dart';

@freezed
sealed class UpdateDeviceScenarioState with _$UpdateDeviceScenarioState {
  const UpdateDeviceScenarioState._();
  const factory UpdateDeviceScenarioState.initial() = _Initial;
  const factory UpdateDeviceScenarioState.loading() = _Loading;
  const factory UpdateDeviceScenarioState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory UpdateDeviceScenarioState.success({required DeviceScenarioEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

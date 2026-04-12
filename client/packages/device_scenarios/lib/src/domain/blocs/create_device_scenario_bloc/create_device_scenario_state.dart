part of 'create_device_scenario_bloc.dart';

@freezed
sealed class CreateDeviceScenarioState with _$CreateDeviceScenarioState {
  const CreateDeviceScenarioState._();
  const factory CreateDeviceScenarioState.initial() = _Initial;
  const factory CreateDeviceScenarioState.loading() = _Loading;
  const factory CreateDeviceScenarioState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory CreateDeviceScenarioState.success({required DeviceScenarioEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

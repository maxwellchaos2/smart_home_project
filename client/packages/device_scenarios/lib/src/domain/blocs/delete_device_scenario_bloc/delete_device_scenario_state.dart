part of 'delete_device_scenario_bloc.dart';

@freezed
sealed class DeleteDeviceScenarioState with _$DeleteDeviceScenarioState {
  const DeleteDeviceScenarioState._();
  const factory DeleteDeviceScenarioState.initial() = _Initial;
  const factory DeleteDeviceScenarioState.loading() = _Loading;
  const factory DeleteDeviceScenarioState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DeleteDeviceScenarioState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

part of 'device_scenario_run_bloc.dart';

@freezed
sealed class DeviceScenarioRunState with _$DeviceScenarioRunState {
  const DeviceScenarioRunState._();
  const factory DeviceScenarioRunState.initial() = _Initial;
  const factory DeviceScenarioRunState.loading() = _Loading;
  const factory DeviceScenarioRunState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DeviceScenarioRunState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

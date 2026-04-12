part of 'device_scenarios_bloc.dart';

@Freezed(copyWith: true)
sealed class DeviceScenariosState with _$DeviceScenariosState {
  const DeviceScenariosState._();
  const factory DeviceScenariosState.initial(
      {List<DeviceScenarioEntity>? data}) = _Initial;
  const factory DeviceScenariosState.loading(
      {List<DeviceScenarioEntity>? data}) = _Loading;
  const factory DeviceScenariosState.failure(
      {List<DeviceScenarioEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DeviceScenariosState.success(
      {required List<DeviceScenarioEntity> data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

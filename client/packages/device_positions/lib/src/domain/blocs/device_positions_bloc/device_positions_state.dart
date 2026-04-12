part of 'device_positions_bloc.dart';

@freezed
sealed class DevicePositionsState with _$DevicePositionsState {
  const DevicePositionsState._();
  const factory DevicePositionsState.initial(
      {List<DevicePositionEntity>? data}) = _Initial;
  const factory DevicePositionsState.loading(
      {List<DevicePositionEntity>? data}) = _Loading;
  const factory DevicePositionsState.failure(
      {List<DevicePositionEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DevicePositionsState.success(
      {required List<DevicePositionEntity> data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

part of 'devices_bloc.dart';

@Freezed(copyWith: true)
sealed class DevicesState with _$DevicesState {
  const DevicesState._();
  const factory DevicesState.initial({List<DeviceEntity>? data}) = _Initial;
  const factory DevicesState.loading({List<DeviceEntity>? data}) = _Loading;
  const factory DevicesState.failure(
      {List<DeviceEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DevicesState.success({required List<DeviceEntity> data}) =
      _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

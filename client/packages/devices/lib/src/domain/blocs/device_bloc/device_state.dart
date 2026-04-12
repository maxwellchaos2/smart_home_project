part of 'device_bloc.dart';

@Freezed(copyWith: true)
sealed class DeviceState with _$DeviceState {
  const DeviceState._();
  const factory DeviceState.initial({DeviceEntity? data}) = _Initial;
  const factory DeviceState.loading({DeviceEntity? data}) = _Loading;
  const factory DeviceState.failure(
      {DeviceEntity? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DeviceState.success({required DeviceEntity data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

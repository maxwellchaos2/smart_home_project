part of 'delete_device_bloc.dart';

@freezed
sealed class DeleteDeviceState with _$DeleteDeviceState {
  const DeleteDeviceState._();
  const factory DeleteDeviceState.initial() = _Initial;
  const factory DeleteDeviceState.loading() = _Loading;
  const factory DeleteDeviceState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DeleteDeviceState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

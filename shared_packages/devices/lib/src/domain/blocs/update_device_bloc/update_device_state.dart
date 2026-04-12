part of 'update_device_bloc.dart';

@freezed
sealed class UpdateDeviceState with _$UpdateDeviceState {
  const UpdateDeviceState._();
  const factory UpdateDeviceState.initial() = _Initial;
  const factory UpdateDeviceState.loading() = _Loading;
  const factory UpdateDeviceState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory UpdateDeviceState.success({required DeviceEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

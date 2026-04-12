part of 'create_device_bloc.dart';

@freezed
sealed class CreateDeviceState with _$CreateDeviceState {
  const CreateDeviceState._();
  const factory CreateDeviceState.initial() = _Initial;
  const factory CreateDeviceState.loading() = _Loading;
  const factory CreateDeviceState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory CreateDeviceState.success({required DeviceEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

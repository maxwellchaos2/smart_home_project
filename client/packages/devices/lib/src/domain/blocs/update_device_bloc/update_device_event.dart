part of 'update_device_bloc.dart';

@freezed
class UpdateDeviceEvent with _$UpdateDeviceEvent {
  const factory UpdateDeviceEvent.update({
    required DeviceInputEntity input,
  }) = _Update;
}

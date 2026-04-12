part of 'create_device_bloc.dart';

@freezed
class CreateDeviceEvent with _$CreateDeviceEvent {
  const factory CreateDeviceEvent.create({
    required DeviceInputEntity input,
  }) = _Create;
}

part of 'delete_device_bloc.dart';

@freezed
class DeleteDeviceEvent with _$DeleteDeviceEvent {
  const factory DeleteDeviceEvent.delete() = _Delete;
}

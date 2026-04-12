part of 'device_bloc.dart';

@freezed
class DeviceEvent with _$DeviceEvent {
  @visibleForTesting
  const factory DeviceEvent.$changed({
    required ChangedEvent<DeviceEntity> event,
  }) = _Changed;
}

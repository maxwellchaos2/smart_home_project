import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:rooms/rooms.dart';

part 'event_input_entity.freezed.dart';

@freezed
sealed class EventInputEntity with _$EventInputEntity {
  const factory EventInputEntity.deviceCreated({
    required DeviceEntity device,
  }) = DeviceCreatedEventInputEntity;

  const factory EventInputEntity.deviceUpdated({
    required DeviceEntity device,
  }) = DeviceUpdatedEventInputEntity;

  const factory EventInputEntity.deviceDeleted({
    required DeviceEntity device,
  }) = DeviceDeletedEventInputEntity;

  const factory EventInputEntity.roomCreated({
    required RoomEntity room,
  }) = RoomCreatedEventInputEntity;

  const factory EventInputEntity.roomUpdated({
    required RoomEntity room,
  }) = RoomUpdatedEventInputEntity;

  const factory EventInputEntity.roomDeleted({
    required RoomEntity room,
  }) = RoomDeletedEventInputEntity;
}

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:rooms/rooms.dart';

part 'event_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class EventEntity with _$EventEntity {
  const EventEntity._();

  const factory EventEntity.deviceCreated({
    required int id,
    required DeviceEntity device,
    required DateTime createdAt,
  }) = DeviceCreatedEventEntity;

  const factory EventEntity.deviceUpdated({
    required int id,
    required DeviceEntity device,
    required DateTime createdAt,
  }) = DeviceUpdatedEventEntity;

  const factory EventEntity.deviceDeleted({
    required int id,
    required DeviceEntity device,
    required DateTime createdAt,
  }) = DeviceDeletedEventEntity;

  const factory EventEntity.roomCreated({
    required RoomEntity room,
    required DateTime createdAt,
  }) = RoomCreatedEventEntity;

  const factory EventEntity.roomUpdated({
    required RoomEntity room,
    required DateTime createdAt,
  }) = RoomUpdatedEventEntity;

  const factory EventEntity.roomDeleted({
    required RoomEntity room,
    required DateTime createdAt,
  }) = RoomDeletedEventEntity;
}

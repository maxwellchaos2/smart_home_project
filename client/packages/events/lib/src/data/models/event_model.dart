import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:rooms/rooms.dart';
import 'package:zigbee_devices/zigbee_devices.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@Freezed(fromJson: true, unionKey: 'type')
sealed class EventModel with _$EventModel {
  const EventModel._();

  const factory EventModel.deviceCreated({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _EventNeedDeviceCreatedModel;

  const factory EventModel.deviceUpdated({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _EventNeedDeviceUpdatedModel;

  const factory EventModel.deviceDeleted({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _EventNeedDeviceDeletedModel;

  const factory EventModel.roomCreated({
    required RoomModel room,
    required DateTime createdAt,
  }) = _EventRoomCreatedModel;

  const factory EventModel.roomUpdated({
    required RoomModel room,
    required DateTime createdAt,
  }) = _EventRoomUpdatedModel;

  const factory EventModel.roomDeleted({
    required RoomModel room,
    required DateTime createdAt,
  }) = _EventRoomDeletedModel;

  const factory EventModel.newZigbeeDevice({
    required ZigbeeDeviceModel device,
  }) = _EventNewZigbeeDeviceModel;

  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}

import 'package:devices/devices.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rooms/rooms.dart';

part 'event_response_model.freezed.dart';
part 'event_response_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
class EventResponseModel with _$EventResponseModel {
  const EventResponseModel._();

  const factory EventResponseModel.deviceCreated({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _DeviceCreated;

  const factory EventResponseModel.deviceUpdated({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _DeviceUpdated;

  const factory EventResponseModel.deviceDeleted({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _DeviceDeleted;

  const factory EventResponseModel.roomCreated({
    required RoomResponseModel room,
    required DateTime createdAt,
  }) = _RoomCreated;

  const factory EventResponseModel.roomUpdated({
    required RoomResponseModel room,
    required DateTime createdAt,
  }) = _RoomUpdated;

  const factory EventResponseModel.roomDeleted({
    required RoomResponseModel room,
    required DateTime createdAt,
  }) = _RoomDeleted;

  @override
  Map<String, dynamic> toJson();
}

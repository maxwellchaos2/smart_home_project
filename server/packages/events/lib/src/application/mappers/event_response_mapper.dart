import 'package:devices/devices.dart';
import 'package:events/src/application/application.dart';
import 'package:events/src/domain/domain.dart';
import 'package:rooms/rooms.dart';

abstract final class EventResponseMapper {
  static EventResponseModel toModel({required EventEntity from}) {
    return from.map(
      deviceCreated: (from) => EventResponseModel.deviceCreated(
        id: from.id,
        device: DeviceResponseMapper.toModel(from: from.device),
        createdAt: from.createdAt,
      ),
      deviceUpdated: (from) => EventResponseModel.deviceUpdated(
        id: from.id,
        device: DeviceResponseMapper.toModel(from: from.device),
        createdAt: from.createdAt,
      ),
      deviceDeleted: (from) => EventResponseModel.deviceDeleted(
        id: from.id,
        device: DeviceResponseMapper.toModel(from: from.device),
        createdAt: from.createdAt,
      ),
      roomCreated: (from) => EventResponseModel.roomCreated(
        room: RoomResponseMapper.toModel(from: from.room),
        createdAt: from.createdAt,
      ),
      roomUpdated: (from) => EventResponseModel.roomUpdated(
        room: RoomResponseMapper.toModel(from: from.room),
        createdAt: from.createdAt,
      ),
      roomDeleted: (from) => EventResponseModel.roomDeleted(
        room: RoomResponseMapper.toModel(from: from.room),
        createdAt: from.createdAt,
      ),
    );
  }
}

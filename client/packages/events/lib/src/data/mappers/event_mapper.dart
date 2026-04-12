import 'package:devices/devices.dart';
import 'package:rooms/rooms.dart';
import 'package:zigbee_devices/zigbee_devices.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class EventMapper {
  static EventEntity toEntity({required EventModel from}) {
    return from.map(
      deviceCreated: (from) => EventEntity.deviceCreated(
        id: from.id,
        device: DeviceResponseMapper.toEntity(from: from.device),
        createdAt: from.createdAt,
      ),
      deviceUpdated: (from) => EventEntity.deviceUpdated(
        id: from.id,
        device: DeviceResponseMapper.toEntity(from: from.device),
        createdAt: from.createdAt,
      ),
      deviceDeleted: (from) => EventEntity.deviceDeleted(
        id: from.id,
        device: DeviceResponseMapper.toEntity(from: from.device),
        createdAt: from.createdAt,
      ),
      roomCreated: (from) => EventEntity.roomCreated(
        room: RoomMapper.toEntity(from: from.room),
        createdAt: from.createdAt,
      ),
      roomUpdated: (from) => EventEntity.roomUpdated(
        room: RoomMapper.toEntity(from: from.room),
        createdAt: from.createdAt,
      ),
      roomDeleted: (from) => EventEntity.roomDeleted(
        room: RoomMapper.toEntity(from: from.room),
        createdAt: from.createdAt,
      ),
      newZigbeeDevice: (from) => EventEntity.newZigbeeDevice(
        device: ZigbeeDeviceMapper.toEntity(from: from.device),
      ),
    );
  }
}

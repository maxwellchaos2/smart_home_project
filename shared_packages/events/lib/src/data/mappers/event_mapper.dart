import 'package:devices_entities/devices_entities.dart';
import 'package:rooms_entities/rooms_entities.dart';

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
      needDeviceCapabilitiesChange: (from) =>
          EventEntity.needDeviceCapabilitiesChange(
        deviceId: from.deviceId,
        capabilities: from.capabilities,
      ),
      deviceStateChanged: (from) => EventEntity.deviceStateChanged(
        deviceId: from.deviceId,
        deviceCapabilities: from.deviceCapabilities,
        deviceProperties: from.deviceProperties,
      ),
      needRunDeviceScenario: (from) => EventEntity.needRunDeviceScenario(
        scenarioId: from.scenarioId,
      ),
      permitJoinZigbeeDevices: (from) => EventEntity.permitJoinZigbeeDevices(
        value: from.value,
        time: from.time,
      ),
    );
  }
}

import 'package:devices/devices.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class EventMapper {
  static EventEntity toEntity({required EventModel from}) {
    return from.map(
      deviceCreated: (from) => EventEntity.deviceCreated(
        id: from.id,
        device: DeviceMapper.toEntity(from: from.device),
        createdAt: from.createdAt,
      ),
      deviceUpdated: (from) => EventEntity.deviceUpdated(
        id: from.id,
        device: DeviceMapper.toEntity(from: from.device),
        createdAt: from.createdAt,
      ),
      deviceDeleted: (from) => EventEntity.deviceDeleted(
        id: from.id,
        device: DeviceMapper.toEntity(from: from.device),
        createdAt: from.createdAt,
      ),
    );
  }
}

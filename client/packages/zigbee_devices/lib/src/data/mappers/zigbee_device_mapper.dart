import 'package:devices/devices.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class ZigbeeDeviceMapper {
  static ZigbeeDeviceEntity toEntity({required ZigbeeDeviceModel from}) {
    return ZigbeeDeviceEntity(
      id: from.id,
      name: from.name,
      type: from.type,
      capabilities: from.capabilities
          .map(DeviceCapabilityEntity.fromJson)
          .toList(growable: false),
      properties: from.properties
          .map(DevicePropertyEntity.fromJson)
          .toList(growable: false),
      interviewCompleted: from.interviewCompleted,
    );
  }
}

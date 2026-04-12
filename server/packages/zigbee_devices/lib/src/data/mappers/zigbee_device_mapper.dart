import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class ZigbeeDeviceMapper {
  static ZigbeeDeviceEntity toEntity({required ZigbeeDeviceModel from}) {
    return ZigbeeDeviceEntity(
      id: from.id,
      name: from.name,
      type: from.type,
      capabilities: from.capabilities,
      properties: from.properties,
    );
  }
}

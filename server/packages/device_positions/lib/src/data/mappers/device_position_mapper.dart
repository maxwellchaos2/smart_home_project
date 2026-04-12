import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class DevicePositionMapper {
  static DevicePositionEntity toEntity({required DevicePositionModel from}) {
    return DevicePositionEntity(
      id: from.id,
      x: from.x,
      y: from.y,
      angle: from.angle,
      iconMediaPath: from.iconMediaPath,
      disabledIconMediaPath: from.disabledIconMediaPath,
      deviceId: from.deviceId,
    );
  }
}

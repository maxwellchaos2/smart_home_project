import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class DevicePositionInputMapper {
  static DevicePositionInputModel toModel(
      {required DevicePositionInputEntity from}) {
    return DevicePositionInputModel(
      x: from.x,
      y: from.y,
      angle: from.angle,
      iconMediaPath: from.iconMediaPath,
      disabledIconMediaPath: from.disabledIconMediaPath,
      deviceId: from.deviceId,
    );
  }
}

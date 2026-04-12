import 'package:device_positions/src/application/application.dart';
import 'package:device_positions/src/domain/domain.dart';

abstract final class DevicePositionInputRequestMapper {
  static DevicePositionInputEntity toEntity({
    required DevicePositionInputRequestModel from,
    required String? iconMediaPath,
    required String? disabledIconMediaPath,
  }) {
    return DevicePositionInputEntity(
      x: from.x,
      y: from.y,
      angle: from.angle,
      iconMediaPath: iconMediaPath,
      disabledIconMediaPath: disabledIconMediaPath,
      deviceId: from.deviceId,
    );
  }
}

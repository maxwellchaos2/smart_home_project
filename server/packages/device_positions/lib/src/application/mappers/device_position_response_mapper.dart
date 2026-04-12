import 'package:device_positions/src/application/application.dart';
import 'package:device_positions/src/domain/domain.dart';

abstract final class DevicePositionResponseMapper {
  static DevicePositionResponseModel toModel(
      {required DevicePositionEntity from}) {
    return DevicePositionResponseModel(
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

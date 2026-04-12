import 'package:devices/devices.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class EventInputMapper {
  static EventInputModel toModel({required EventInputEntity from}) {
    return from.mapOrNull(
      deviceCreated: (from) => EventInputModel.deviceCreated(
        device: DeviceMapper.toModel(from: from.device),
        deviceId: from.device.id,
      ),
      deviceUpdated: (from) => EventInputModel.deviceUpdated(
        device: DeviceMapper.toModel(from: from.device),
        deviceId: from.device.id,
      ),
      deviceDeleted: (from) => EventInputModel.deviceDeleted(
        device: DeviceMapper.toModel(from: from.device),
        deviceId: from.device.id,
      ),
    )!;
  }
}

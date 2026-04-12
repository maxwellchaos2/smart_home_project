import 'package:devices/src/domain/entities/entities.dart';

bool checkDeviceIsOff(
  DeviceEntity device,
) {
  if (device.type != DeviceType.doorWithLock &&
      device.capabilities
              .byTypeOrNull<DeviceCapabilityStateOnEntity>()
              ?.value ==
          false) {
    return true;
  }
  for (final property in device.properties) {
    if (property is DevicePropertyEventEntity &&
        property.state?['instance'] == 'open' &&
        property.state?['value'] == 'closed') {
      return true;
    } else if (property is DevicePropertyEventEntity &&
        property.state?['instance'] == 'motion' &&
        property.state?['value'] == 'not_detected') {
      return true;
    }
  }
  return false;
}

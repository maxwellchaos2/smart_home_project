import 'package:devices/devices.dart';
import 'package:zigbee_devices/src/domain/entities/zigbee_device_entity.dart';

abstract final class DeviceInputMapper {
  static DeviceInputEntity fromZigbee({required ZigbeeDeviceEntity from}) {
    return DeviceInputEntity(
      isHidden: false,
      providerDeviceId: from.id,
      providerType: DeviceProviderType.zigbee,
      type: DeviceTypeMapper.toEntity(from: from.type),
      name: from.name,
      capabilities: from.capabilities,
      properties: from.properties,
      roomId: null,
      floorId: null,
      customData: null,
    );
  }
}

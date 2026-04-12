import 'package:devices_entities/devices_entities.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class EventMessageInputMapper {
  static EventMessageInputModel toModel(
      {required EventMessageInputEntity from}) {
    return from.map(
      needDeviceCapabilitiesChange: (from) =>
          EventMessageInputModel.needDeviceCapabilitiesChange(
        deviceId: from.deviceId,
        providerType: switch (from.providerType) {
          null => null,
          final value => DeviceProviderTypeMapper.toModel(from: value),
        },
        providerDeviceId: from.providerDeviceId,
        capabilities: from.capabilities.map((e) => e.toJson()).toList(),
      ),
      deviceCapabilitiesChanged: (from) =>
          EventMessageInputModel.deviceCapabilitiesChanged(
        deviceId: from.deviceId,
        providerType: switch (from.providerType) {
          null => null,
          final value => DeviceProviderTypeMapper.toModel(from: value),
        },
        providerDeviceId: from.providerDeviceId,
        capabilities: from.capabilities.map((e) => e.toJson()).toList(),
      ),
      devicePropertiesChanged: (from) =>
          EventMessageInputModel.devicePropertiesChanged(
        deviceId: from.deviceId,
        providerType: switch (from.providerType) {
          null => null,
          final value => DeviceProviderTypeMapper.toModel(from: value),
        },
        properties: from.properties.map((e) => e.toJson()).toList(),
      ),
      newZigbeeDevice: (value) => EventMessageInputModel.newZigbeeDevice(
        device: value.device,
      ),
      onDeviceHeartbeat: (value) => EventMessageInputModel.onDeviceHeartbeat(
        deviceId: value.deviceId,
      ),
    );
  }
}

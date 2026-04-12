import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class EventMessageInputMapper {
  static EventMessageInputModel toModel(
      {required EventMessageInputEntity from}) {
    return from.map(
      needDeviceCapabilitiesChange: (from) =>
          EventMessageInputModel.needDeviceCapabilitiesChange(
        deviceId: from.deviceId,
        capabilities: from.capabilities.map((e) => e.toJson()).toList(),
      ),
      devicePropertiesChanged: (from) =>
          EventMessageInputModel.devicePropertiesChanged(
        deviceId: from.deviceId,
        properties: from.properties.map((e) => e.toJson()).toList(),
      ),
      permitJoinZigbeeDevices: (from) =>
          EventMessageInputModel.permitJoinZigbeeDevices(
        projectId: from.projectId,
        value: from.value,
        time: from.time,
      ),
    );
  }
}

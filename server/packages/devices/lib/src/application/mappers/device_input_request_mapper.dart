import 'package:devices/src/application/application.dart';
import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';

abstract final class DeviceInputRequestMapper {
  static DeviceInputEntity toEntity(
      {required DeviceInputRequestModel from, required int projectId}) {
    return DeviceInputEntity(
      isHidden: from.isHidden ?? false,
      type: DeviceTypeMapper.toEntity(from: from.type),
      providerType: DeviceProviderTypeMapper.toEntity(from: from.providerType),
      providerDeviceId: from.providerDeviceId,
      inputId: from.inputId,
      outputId: from.outputId,
      name: from.name,
      capabilities: from.capabilities
          .map(
            (capability) => DeviceCapabilityEntity.fromJson(capability),
          )
          .toList(),
      properties: from.properties
          .map(
            (property) => DevicePropertyEntity.fromJson(property),
          )
          .toList(),
      roomId: from.roomId,
      floorId: from.floorId,
      projectId: projectId,
      customData: from.customData,
    );
  }
}

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class DeviceMapper {
  static DeviceEntity toEntity({required DeviceModel from}) {
    return DeviceEntity(
      isHidden: from.isHidden,
      type: DeviceTypeMapper.toEntity(from: from.type),
      providerType: DeviceProviderTypeMapper.toEntity(from: from.provider),
      providerDeviceId: from.providerDeviceId,
      id: from.id,
      inputId: from.inputId,
      outputId: from.outputId,
      name: from.name,
      capabilities: from.capabilities
          .map(
            (capability) => DeviceCapabilityEntity.fromJson(
              capability,
            ),
          )
          .toList(),
      properties: from.properties
          .map(
            (property) => DevicePropertyEntity.fromJson(
              property,
            ),
          )
          .toList(),
      roomId: from.roomId,
      floorId: from.floorId,
      projectId: from.projectId,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      customData: from.customData,
      lastHeartbeat: from.lastHeartbeat,
      status: DeviceStatus.values.byName(from.status),
    );
  }

  static DeviceModel toModel({required DeviceEntity from}) {
    return DeviceModel(
      isHidden: from.isHidden,
      type: DeviceTypeMapper.toModel(from: from.type),
      provider: DeviceProviderTypeMapper.toModel(from: from.providerType),
      providerDeviceId: from.providerDeviceId,
      id: from.id,
      inputId: from.inputId,
      outputId: from.outputId,
      name: from.name,
      capabilities: from.capabilities
          .map(
            (capability) => capability.toJson(),
          )
          .toList(),
      properties: from.properties
          .map(
            (property) => property.toJson(),
          )
          .toList(),
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      roomId: from.roomId,
      floorId: from.floorId,
      projectId: from.projectId,
      customData: from.customData,
      lastHeartbeat: from.lastHeartbeat,
      status: from.status.name,
    );
  }
}

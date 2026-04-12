import 'package:devices_entities/devices_entities.dart';

abstract final class DeviceResponseMapper {
  static List<DeviceCapabilityEntity> _toCapabilities(
      {required List<Map<String, dynamic>> from}) {
    return from
        .map(
          (capability) => DeviceCapabilityEntity.fromJson(capability),
        )
        .toList();
  }

  static List<DevicePropertyEntity> _toProperties(
      {required List<Map<String, dynamic>> from}) {
    return from
        .map(
          (property) => DevicePropertyEntity.fromJson(property),
        )
        .toList();
  }

  static DeviceEntity toEntity({required DeviceResponseModel from}) {
    return DeviceEntity(
      id: from.id,
      providerDeviceId: from.providerDeviceId,
      providerType: DeviceProviderTypeMapper.toEntity(from: from.providerType),
      type: DeviceTypeMapper.toEntity(from: from.type),
      name: from.name,
      capabilities: _toCapabilities(from: from.capabilities),
      properties: _toProperties(from: from.properties),
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      roomId: from.roomId,
      floorId: from.floorId,
      projectId: from.projectId,
    );
  }
}

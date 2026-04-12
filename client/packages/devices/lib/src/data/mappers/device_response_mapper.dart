import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';

abstract final class DeviceResponseMapper {
  static DeviceProviderType _toProviderType({required String from}) {
    return DeviceProviderTypeMapper.toEntity(from: from);
  }

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
      isHidden: from.isHidden,
      providerDeviceId: from.providerDeviceId,
      providerType: _toProviderType(from: from.providerType),
      type: DeviceTypeMapper.toEntity(from: from.type),
      name: from.name,
      capabilities: _toCapabilities(from: from.capabilities),
      properties: _toProperties(from: from.properties),
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      roomId: from.roomId,
      floorId: from.floorId,
      projectId: from.projectId,
      customData: from.customData,
      status: switch (from.status) {
        'online' => DeviceStatus.online,
        'offline' => DeviceStatus.offline,
        _ => DeviceStatus.offline,
      },
    );
  }
}

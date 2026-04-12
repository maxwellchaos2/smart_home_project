import 'package:devices/src/application/application.dart';
import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';

abstract final class DeviceResponseMapper {
  static DeviceResponseModel toModel({required DeviceEntity from}) {
    return DeviceResponseModel(
      isHidden: from.isHidden,
      providerType: DeviceProviderTypeMapper.toModel(from: from.providerType),
      providerDeviceId: from.providerDeviceId,
      type: DeviceTypeMapper.toModel(from: from.type),
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

import 'dart:convert';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class DeviceInputMapper {
  static DeviceInputModel toModel({required DeviceInputEntity from}) {
    return DeviceInputModel(
      isHidden: from.isHidden,
      type: DeviceTypeMapper.toModel(from: from.type),
      provider: DeviceProviderTypeMapper.toModel(from: from.providerType),
      providerDeviceId: from.providerDeviceId,
      inputId: from.inputId,
      outputId: from.outputId,
      name: from.name,
      capabilities: jsonEncode(from.capabilities
          .map(
            (capability) => capability.toJson(),
          )
          .toList()),
      properties: jsonEncode(from.properties
          .map(
            (property) => property.toJson(),
          )
          .toList()),
      roomId: from.roomId,
      floorId: from.floorId,
      projectId: from.projectId,
      customData: from.customData,
    );
  }
}

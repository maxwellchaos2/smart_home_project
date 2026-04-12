import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class DeviceInputMapper {
  static DeviceInputModel toModel({required DeviceInputEntity from}) {
    return DeviceInputModel(
      type: DeviceTypeMapper.toModel(from: from.type),
      providerType: DeviceProviderTypeMapper.toModel(from: from.providerType),
      providerDeviceId: from.providerDeviceId,
      inputId: from.inputId,
      outputId: from.outputId,
      name: from.name,
      capabilities: from.capabilities
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      properties: from.properties
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      roomId: from.roomId,
      floorId: from.floorId,
    );
  }
}

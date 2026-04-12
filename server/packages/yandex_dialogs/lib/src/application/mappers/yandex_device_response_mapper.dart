import 'package:devices/devices.dart';
import 'package:yandex_devices/yandex_devices.dart';
import 'package:yandex_dialogs/src/application/application.dart';

abstract final class YandexDeviceResponseMapper {
  static YandexDeviceResponseModel toModel({required DeviceEntity from}) {
    return YandexDeviceResponseModel(
      id: from.id.toString(),
      name: from.name,
      statusInfo: DeviceStatusInfoModel(reportable: true),
      description: null, // TODO
      room: null, // TODO
      type: YandexDeviceTypeMapper.toModel(from: from.type),
      customData: null,
      capabilities: from.capabilities
          .map(
            (capability) => _capabilityToYandex(capability),
          )
          .toList(),
      properties: from.properties
          .map((property) => _propertyToYandex(property))
          .toList(),
      deviceInfo: null,
    );
  }
}

Map<String, Object?> _capabilityToYandex(
  DeviceCapabilityEntity capability,
) {
  final result = capability.toJson();
  return {
    ...result,
    'type': 'devices.capabilities.${result['type']}',
    'parameters': result['parameters'],
  };
}

Map<String, Object?> _propertyToYandex(
  DevicePropertyEntity property,
) {
  final result = property.toJson();
  return {
    ...result,
    'type': 'devices.properties.${result['type']}',
    'parameters': result['parameters'],
  };
}

Map<String, dynamic> capabilityFromYandex(
  Map<String, dynamic> capability,
) {
  final parameters = capability['parameters'] as Map<String, dynamic>?;
  final type = (capability['type'] as String).split('.').last;
  return {
    ...capability,
    'type': (capability['type'] as String).split('.').last,
    'parameters': parameters != null
        ? {
            'instance': type,
            ...parameters,
          }
        : null,
  };
}

Map<String, dynamic> propertyFromYandex(
  Map<String, dynamic> property,
) {
  final parameters = property['parameters'] as Map<String, dynamic>?;
  final type = (property['type'] as String).split('.').last;
  return {
    ...property,
    'type': (property['type'] as String).split('.').last,
    'parameters': parameters != null
        ? {
            'instance': type,
            ...parameters,
          }
        : null,
  };
}

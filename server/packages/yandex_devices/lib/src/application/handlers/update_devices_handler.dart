import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:shelf/shelf.dart';
import 'package:yandex_auth/yandex_auth.dart';
import 'package:yandex_devices/yandex_devices.dart';

Future<Response> updateDevicesHandler(Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;

  final repository = locator.get<IYandexAuthRepository>();
  final devicesRepository = locator.get<IDevicesRepository>();
  final yandexDevicesRepository = locator.get<IYandexDevicesRepository>();

  final token = await repository.fetchToken(projectId: int.parse(projectId));

  if (token == null) {
    return Response(400, body: 'Token is required');
  }

  final yandexDevices = await yandexDevicesRepository.fetch(
    authToken: token.accessToken,
  );

  final devices =
      await devicesRepository.fetchAll(projectId: int.parse(projectId));

  for (final yDevice in yandexDevices) {
    try {
      final deviceNeedUpdate = devices.firstWhereOrNull(
        (device) =>
            device.providerType == DeviceProviderType.yandex &&
            device.providerDeviceId == yDevice.id,
      );

      if (deviceNeedUpdate == null) {
        await devicesRepository.createDevice(
          input: DeviceInputEntity(
            isHidden: false,
            name: yDevice.name,
            inputId: null,
            outputId: null,
            type: _getDeviceType(yDevice.type),
            providerType: DeviceProviderType.yandex,
            providerDeviceId: yDevice.id,
            projectId: int.parse(projectId),
            roomId: null,
            floorId: null,
            capabilities: yDevice.capabilities
                .map(
                  (capability) => DeviceCapabilityEntity.fromJson(
                      capabilityFromYandex(capability)),
                )
                .toList(),
            properties: yDevice.properties
                .map(
                  (property) => DevicePropertyEntity.fromJson(
                    propertyFromYandex(property),
                  ),
                )
                .toList(),
            customData: null,
          ),
        );
        continue;
      }

      await devicesRepository.updateDevice(
          deviceId: deviceNeedUpdate.id,
          input: DeviceInputEntity(
            isHidden: deviceNeedUpdate.isHidden,
            name: deviceNeedUpdate.name,
            inputId: null,
            outputId: null,
            type: deviceNeedUpdate.type,
            providerType: DeviceProviderType.yandex,
            providerDeviceId: yDevice.id,
            projectId: int.parse(projectId),
            roomId: deviceNeedUpdate.roomId,
            floorId: deviceNeedUpdate.floorId,
            capabilities: yDevice.capabilities
                .map(
                  (capability) => DeviceCapabilityEntity.fromJson(
                      capabilityFromYandex(capability)),
                )
                .toList(),
            properties: yDevice.properties
                .map(
                  (property) => DevicePropertyEntity.fromJson(
                    propertyFromYandex(property),
                  ),
                )
                .toList(),
            customData: deviceNeedUpdate.customData,
          ));
    } catch (e) {
      print('Error updating device ${yDevice.id}: $e');
      continue;
    }
  }

  for (final device in devices) {
    if (device.providerType == DeviceProviderType.yandex &&
        !yandexDevices
            .any((yDevice) => yDevice.id == device.providerDeviceId)) {
      await devicesRepository.deleteDevice(id: device.id);
    }
  }

  return Response.ok('Success');
}

DeviceType _getDeviceType(String type) {
  return YandexDeviceTypeMapper.toEntity(from: type);
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

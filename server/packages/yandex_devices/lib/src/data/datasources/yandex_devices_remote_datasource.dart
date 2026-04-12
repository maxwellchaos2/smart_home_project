import 'package:yandex_devices/src/data/data.dart';
import 'package:yandex_devices/src/domain/domain.dart';

abstract interface class IYandexDevicesRemoteDatasource {
  Future<List<YandexDeviceEntity>> fetchAll({
    required String authToken,
  });

  Future<List<YandexActionDeviceResultEntity>> updateDeviceCapabilitiesState({
    required String authToken,
    required String deviceId,
    required List<Map<String, dynamic>> capabilities,
  });
}

final class YandexDevicesRemoteDatasourceImpl
    implements IYandexDevicesRemoteDatasource {
  const YandexDevicesRemoteDatasourceImpl(
      {required YandexDevicesApiClient client})
      : _client = client;

  final YandexDevicesApiClient _client;

  Future<List<YandexDeviceEntity>> fetchAll({
    required String authToken,
  }) async {
    final response =
        await _client.fetchUserInfo(authToken: 'Bearer $authToken');
    return response.devices
        .where((device) =>
            device.skillId != '8b5f6f34-71ed-4390-b6b6-13df95fecda2' &&
            device.skillId != '637925fc-c16a-458b-b878-c3a6c7024512-draft' &&
            device.skillId != '637925fc-c16a-458b-b878-c3a6c7024512')
        .map((device) => YandexDeviceMapper.toEntity(from: device))
        .toList();
  }

  Future<List<YandexActionDeviceResultEntity>> updateDeviceCapabilitiesState({
    required String authToken,
    required String deviceId,
    required List<Map<String, dynamic>> capabilities,
  }) async {
    final response = await _client.updateDeviceCapabilitiesState(
      authToken: 'Bearer $authToken',
      data: {
        'devices': [
          {
            'id': deviceId,
            'actions': capabilities,
          },
        ],
      },
    );
    return YandexActionDeviceResultMapper.toEntity(from: response);
  }
}

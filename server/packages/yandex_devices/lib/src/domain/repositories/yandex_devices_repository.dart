import 'package:yandex_devices/src/domain/domain.dart';

abstract interface class IYandexDevicesRepository {
  Future<List<YandexDeviceEntity>> fetch({
    required String authToken,
  });

  Future<List<YandexActionDeviceResultEntity>> updateDeviceCapabilitiesState({
    required String authToken,
    required String deviceId,
    required List<Map<String, dynamic>> capabilities,
  });
}

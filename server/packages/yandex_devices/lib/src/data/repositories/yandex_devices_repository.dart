import 'package:yandex_devices/src/data/data.dart';
import 'package:yandex_devices/src/domain/domain.dart';

final class YandexDevicesRepositoryImpl implements IYandexDevicesRepository {
  const YandexDevicesRepositoryImpl({
    required IYandexDevicesRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IYandexDevicesRemoteDatasource _remoteSource;

  @override
  Future<List<YandexDeviceEntity>> fetch({required String authToken}) {
    return _remoteSource.fetchAll(authToken: authToken);
  }

  @override
  Future<List<YandexActionDeviceResultEntity>> updateDeviceCapabilitiesState(
      {required String authToken,
      required String deviceId,
      required List<Map<String, dynamic>> capabilities}) {
    return _remoteSource.updateDeviceCapabilitiesState(
      authToken: authToken,
      deviceId: deviceId,
      capabilities: capabilities,
    );
  }
}

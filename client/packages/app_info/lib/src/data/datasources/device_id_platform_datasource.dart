import 'package:app_info/src/data/data.dart';

abstract interface class IDeviceIdPlatformDatasource {
  Future<String> fetchDeviceId();
}

final class DeviceIdPlatformDatasourceImpl
    implements IDeviceIdPlatformDatasource {
  final IDeviceIdApiClient _client;

  DeviceIdPlatformDatasourceImpl({required IDeviceIdApiClient client})
      : _client = client;

  @override
  Future<String> fetchDeviceId() async {
    return await _client.getDeviceId();
  }
}

import 'package:wifi_devices/src/data/data.dart';

abstract interface class IWifiPlatformDatasource {
  Future<String?> fetchName();
}

final class WifiPlatformDatasourceImpl implements IWifiPlatformDatasource {
  const WifiPlatformDatasourceImpl({required IWifiInfoClient client})
      : _client = client;

  final IWifiInfoClient _client;

  @override
  Future<String?> fetchName() async {
    return _client.fetchWifiName();
  }
}

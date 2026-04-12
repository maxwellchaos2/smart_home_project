import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

abstract interface class IWifiInfoClient {
  Future<String?> fetchWifiName();
}

final class WifiInfoClientImpl implements IWifiInfoClient {
  const WifiInfoClientImpl({required NetworkInfo networkInfo})
      : _networkInfo = networkInfo;

  final NetworkInfo _networkInfo;

  @override
  Future<String?> fetchWifiName() async {
    // Запрашиваем разрешение на геолокацию (требуется для WiFi имени на iOS)
    final locationStatus = await Permission.location.request();

    final result = await _networkInfo.getWifiName();
    print(await _networkInfo.getWifiBSSID());
    print(await _networkInfo.getWifiIP());
    print(await _networkInfo.getWifiSubmask());
    print(await _networkInfo.getWifiGatewayIP());
    print(await _networkInfo.getWifiBroadcast());
    print(await _networkInfo.getWifiIPv6());
    print(await _networkInfo.getWifiName());
    return result;
  }
}

import 'package:common/common.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:wifi_devices/src/data/data.dart';
import 'package:wifi_devices/src/domain/domain.dart';

abstract final class WifiDevicesDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IWifiRepository getRepo({required GetIt locator}) {
    return WifiRepositoryImpl(
      platformSource: WifiPlatformDatasourceImpl(
        client: WifiInfoClientImpl(networkInfo: NetworkInfo()),
      ),
    );
  }
}

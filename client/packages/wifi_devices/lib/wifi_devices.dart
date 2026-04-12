library;

import 'package:common/common.dart';
import 'package:wifi_devices/src/di/di.dart';

export 'src/application/application.dart' show AddWifiDevicesScreen;

abstract final class WifiDevicesModule {
  static Future<void> init({required GetIt locator}) async {
    await WifiDevicesDI.init(locator: locator);
  }
}

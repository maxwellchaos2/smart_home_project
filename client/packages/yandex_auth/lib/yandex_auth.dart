library;

import 'package:common/common.dart';
import 'package:yandex_auth/src/di/di.dart';

export 'src/application/application.dart'
    show
        YandexSignInButton,
        AddYandexDevicesScreen,
        UpdateYandexDevicesScope,
        UpdateYandexDevicesBlocListener;

abstract final class YandexAuthModule {
  static Future<void> init({required GetIt locator}) async {
    await YandexAuthDI.init(locator: locator);
  }
}

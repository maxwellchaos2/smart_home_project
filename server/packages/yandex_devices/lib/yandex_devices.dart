library;

import 'package:common/common.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:yandex_devices/src/di/di.dart';

import 'src/application/handlers/handlers.dart';

export 'src/data/data.dart' show YandexDeviceMapper, YandexDeviceTypeMapper;
export 'src/domain/domain.dart' show IYandexDevicesRepository;

abstract final class YandexDevicesModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await YandexDevicesDI.init(
      locator: locator,
    );
  }
}

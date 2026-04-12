library;

import 'package:common/common.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:yandex_auth/src/application/handlers/handlers.dart';
import 'package:yandex_auth/src/di/di.dart';

export 'src/domain/domain.dart'
    show IYandexAuthRepository, YandexAuthTokenEntity;

abstract final class YandexAuthModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await YandexAuthDI.init(
      locator: locator,
    );
  }
}

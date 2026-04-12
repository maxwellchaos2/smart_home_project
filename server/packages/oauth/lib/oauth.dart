library;

import 'package:common/common.dart';
import 'package:oauth/src/application/application.dart';
import 'package:oauth/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/domain/domain.dart' show IAuthCodeRepository;

abstract final class OAuthModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await OAuthDI.init(
      locator: locator,
    );
  }
}

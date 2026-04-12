library;

import 'package:auth_token/src/application/application.dart';
import 'package:common/common.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/application/application.dart' show authMiddleware;

abstract final class AuthTokenModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);
  }
}

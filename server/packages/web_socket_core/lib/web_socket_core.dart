library;

import 'package:common/common.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:web_socket_core/src/application/application.dart';
import 'package:web_socket_core/src/di/di.dart';

export 'src/domain/domain.dart'
    show WebSocketIsolatesService, IWebSocketRepository, WebSocketMessageEntity;

abstract final class WebSocketCoreModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await WebSocketCoreDI.init(
      locator: locator,
    );
  }
}

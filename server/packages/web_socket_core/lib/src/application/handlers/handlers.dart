import 'package:shelf_router/shelf_router.dart';

import 'ws_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/ws', wsHandler);
}

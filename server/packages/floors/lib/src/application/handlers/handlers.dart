import 'package:shelf_router/shelf_router.dart';

import 'create_floor_handler.dart';
import 'fetch_floors_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/api/projects/<projectId>/floors', fetchFloorsHandler);
  router.post('/api/projects/<projectId>/floors/create', createFloorHandler);
}

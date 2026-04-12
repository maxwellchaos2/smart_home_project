import 'package:rooms/src/application/handlers/update_room_handler.dart';
import 'package:shelf_router/shelf_router.dart';

import 'create_room_handler.dart';
import 'delete_room_handler.dart';
import 'fetch_rooms_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/api/projects/<projectId>/rooms', fetchRoomsHandler);
  router.post('/api/projects/<projectId>/rooms/create', createRoomHandler);
  router.put('/api/projects/<projectId>/rooms/<id>/update', updateRoomHandler);
  router.delete(
      '/api/projects/<projectId>/rooms/<id>/delete', deleteRoomHandler);
}

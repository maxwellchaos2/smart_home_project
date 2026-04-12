import 'package:device_positions/src/application/handlers/update_device_position_handler.dart';
import 'package:shelf_router/shelf_router.dart';

import 'create_device_position_handler.dart';
import 'delete_device_position_handler.dart';
import 'fetch_device_positions_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/api/device-positions', fetchDevicePositionsHandler);
  router.post('/api/device-positions/create', createDevicePositionHandler);
  router.put('/api/device-positions/<id>/update', updateDevicePositionHandler);
  router.delete(
      '/api/device-positions/<id>/delete', deleteDevicePositionHandler);
}

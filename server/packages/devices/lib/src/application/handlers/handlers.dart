import 'package:shelf_router/shelf_router.dart';

import 'create_device_handler.dart';
import 'delete_device_handler.dart';
import 'fetch_device_handler.dart';
import 'fetch_devices_handler.dart';
import 'update_device_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/api/projects/<projectId>/devices', fetchDevicesHandler);
  router.post('/api/projects/<projectId>/devices/create', createDeviceHandler);
  router.get('/api/projects/<projectId>/devices/<id>', fetchDeviceHandler);
  router.put(
      '/api/projects/<projectId>/devices/<id>/update', updateDeviceHandler);
  router.delete(
      '/api/projects/<projectId>/devices/<id>/delete', deleteDeviceHandler);
}

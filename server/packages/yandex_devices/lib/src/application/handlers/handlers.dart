import 'package:shelf_router/shelf_router.dart';

import 'update_devices_handler.dart';

void registerRouterHandlers(Router router) {
  router.post(
      '/api/projects/<projectId>/yandex-devices/update', updateDevicesHandler);
}

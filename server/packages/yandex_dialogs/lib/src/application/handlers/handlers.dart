import 'package:shelf_router/shelf_router.dart';
import 'package:yandex_dialogs/src/application/handlers/action_devices_handler.dart';
import 'package:yandex_dialogs/src/application/handlers/check_handler.dart';

import 'fetch_devices_handler.dart';
import 'fetch_devices_state_handler.dart';

void registerRouterHandlers(Router router) {
  router.head('/yandex/v1.0', checkHandler);
  router.get('/yandex/v1.0/user/devices', fetchDevicesHandler);
  router.post('/yandex/v1.0/user/devices/query', fetchDevicesStateHandler);
  router.post('/yandex/v1.0/user/devices/action', actionDevicesHandler);
}

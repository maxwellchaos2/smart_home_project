import 'package:shelf_router/shelf_router.dart';

import 'login_device_handler.dart';
import 'login_handler.dart';
import 'refresh_token_handler.dart';
import 'revoke_token_handler.dart';

void registerRouterHandlers(Router router) {
  router.post('/api/tokens/login', loginHandler);
  router.post('/api/tokens/refresh', refreshTokenHandler);
  router.post('/api/tokens/revoke', revokeTokenHandler);

  router.post('/api/tokens/login-device', loginDeviceHandler);
}

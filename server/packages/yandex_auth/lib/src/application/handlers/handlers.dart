import 'package:shelf_router/shelf_router.dart';

import 'auth_by_code_handler.dart';
import 'revoke_token_handler.dart';

void registerRouterHandlers(Router router) {
  router.post('/api/yandex-auth/token', authByCodeHandler);
  router.post('/api/yandex-auth/revoke', revokeTokenHandler);
}

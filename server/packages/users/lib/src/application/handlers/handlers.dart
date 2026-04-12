import 'package:shelf_router/shelf_router.dart';
import 'package:users/src/application/handlers/user_me_handler.dart';

import 'create_user_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/api/users/me', userMeHandler);
  router.post('/api/users/create', createUserHandler);
}

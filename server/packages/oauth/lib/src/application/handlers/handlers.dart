import 'package:shelf_router/shelf_router.dart';

import 'login_handler.dart';
import 'login_submit_handler.dart';
import 'token_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/oauth/login', loginHandler);
  router.post('/oauth/login/submit', loginSubmitHandler);
  router.post('/oauth/token', tokenHandler);
}

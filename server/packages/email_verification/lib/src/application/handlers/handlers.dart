import 'package:shelf_router/shelf_router.dart';

import 'confirm_code_handler.dart';
import 'send_code_handler.dart';

void registerRouterHandlers(Router router) {
  router.post('/email_verification/send_code', sendCodeHandler);
  router.post('/email_verification/confirm_code', confirmCodeHandler);
}

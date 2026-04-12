library;

import 'package:common/common.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smtp/src/di/di.dart';

import 'src/application/application.dart';

export 'src/domain/domain.dart' show IEmailVerificationRepository;

abstract final class EmailVerificationModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);
    await SmtpDI.init(
        locator: locator,
        client: SmtpServer(
          ENV.fromKey('SMTP_HOST'),
          port: ENV.fromKeyInt('SMTP_PORT'),
          ssl: true,
          username: ENV.fromKey('SMTP_USERNAME'),
          password: ENV.fromKey('SMTP_PASSWORD'),
        ));
  }
}

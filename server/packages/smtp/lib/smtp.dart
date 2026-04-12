library;

import 'package:common/common.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smtp/src/di/di.dart';

export 'package:smtp/src/domain/domain.dart'
    show ISmtpRepository, SmtpMessageEntity;

abstract final class SmtpModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
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

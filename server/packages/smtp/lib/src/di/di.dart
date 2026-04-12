import 'package:common/common.dart';
import 'package:smtp/src/data/data.dart';
import 'package:smtp/src/domain/domain.dart';
import 'package:mailer/smtp_server.dart';

abstract final class SmtpDI {
  static Future<void> init({
    required GetIt locator,
    required SmtpServer client,
  }) async {
    locator
        .registerLazySingleton(() => getRepo(locator: locator, client: client));
  }

  static ISmtpRepository getRepo({
    required GetIt locator,
    required SmtpServer client,
  }) {
    return SmtpRepositoryImpl(
      remoteSource: SmtpRemoteDatasourceImpl(
        client: client,
      ),
    );
  }
}

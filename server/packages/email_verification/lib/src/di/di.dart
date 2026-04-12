import 'package:common/common.dart';
import 'package:email_verification/src/data/data.dart';
import 'package:email_verification/src/domain/domain.dart';
import 'package:mailer/smtp_server.dart';

abstract final class EmailVerificationDI {
  static Future<void> init({
    required GetIt locator,
    required SmtpServer client,
  }) async {
    locator
        .registerLazySingleton(() => getRepo(locator: locator, client: client));
  }

  static IEmailVerificationRepository getRepo({
    required GetIt locator,
    required SmtpServer client,
  }) {
    return VerificationCodeRepositoryImpl(
      localDatasource: VerificationCodeLocalDatasourceImpl(
        databaseClient: VerificationCodeDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

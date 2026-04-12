import 'package:common/common.dart';
import 'package:oauth/src/data/data.dart';
import 'package:oauth/src/data/repositoiries/repositoiries.dart';
import 'package:oauth/src/domain/domain.dart';

abstract final class OAuthDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getCodeRepo(locator: locator));
  }

  static IAuthCodeRepository getCodeRepo({
    required GetIt locator,
  }) {
    return AuthCodeRepositoryImpl(
      databaseSource: AuthCodeDatabaseDatasourceImpl(
        client: AuthCodeDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

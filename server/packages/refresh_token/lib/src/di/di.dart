import 'package:common/common.dart';
import 'package:refresh_token/src/data/data.dart';
import 'package:refresh_token/src/domain/domain.dart';

abstract final class RefreshTokenDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IRefreshTokenRepository getRepo({
    required GetIt locator,
  }) {
    return RefreshTokenRepositoryImpl(
      databaseSource: RefreshTokenDatabaseDatasourceImpl(
        client: RefreshTokenDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:yandex_auth/src/data/clients/yandex_auth_api_client.dart';
import 'package:yandex_auth/src/data/data.dart';
import 'package:yandex_auth/src/domain/domain.dart';

abstract final class YandexAuthDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IYandexAuthRepository getRepo({
    required GetIt locator,
  }) {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

    return YandexAuthRepositoryImpl(
      databaseSource: YandexAuthTokenDatabaseDatasourceImpl(
        client: AuthCodeDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
      remoteSource: YandexAuthRemoteDatasourceImpl(
        client: YandexAuthApiClient(dio),
      ),
    );
  }
}

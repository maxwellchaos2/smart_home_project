import 'package:common/common.dart';
import 'package:yandex_auth/src/data/clients/yandex_auth_api_client.dart';
import 'package:yandex_auth/src/data/datasources/datasources.dart';
import 'package:yandex_auth/src/data/repositories/yandex_auth_repository.dart';
import 'package:yandex_auth/src/domain/domain.dart';

abstract final class YandexAuthDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IYandexAuthRepository getRepo({required GetIt locator}) {
    return YandexAuthRepositoryImpl(
      remoteSource: YandexAuthDatasourceImpl(
        client: YandexAuthApiClient(locator.get()),
      ),
    );
  }
}

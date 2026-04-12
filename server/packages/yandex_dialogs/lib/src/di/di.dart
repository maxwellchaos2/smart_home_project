import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:yandex_dialogs/src/data/data.dart';
import 'package:yandex_dialogs/src/data/repositories/repositories.dart';
import 'package:yandex_dialogs/src/domain/domain.dart';

abstract final class YandexDialogsDI {
  static Future<void> init({
    required GetIt locator,
    required String skillId,
    required String oauthToken,
  }) async {
    locator.registerLazySingleton(() =>
        getRepo(locator: locator, skillId: skillId, oauthToken: oauthToken));
  }

  static IYandexDialogsRepository getRepo({
    required GetIt locator,
    required String skillId,
    required String oauthToken,
  }) {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'OAuth $oauthToken';
    dio.options.baseUrl = 'https://dialogs.yandex.net/api/v1/skills/$skillId';
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      logPrint: print,
    ));

    return YandexDialogsRepositoryImpl(
      remoteSource: YandexDialogsRemoteDatasourceImpl(
        client: YandexDialogsClient(dio),
      ),
    );
  }
}

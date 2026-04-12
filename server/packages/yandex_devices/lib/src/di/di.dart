import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:yandex_devices/src/data/data.dart';
import 'package:yandex_devices/src/domain/repositories/yandex_devices_repository.dart';

abstract final class YandexDevicesDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IYandexDevicesRepository getRepo({
    required GetIt locator,
  }) {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    return YandexDevicesRepositoryImpl(
      remoteSource: YandexDevicesRemoteDatasourceImpl(
        client: YandexDevicesApiClient(dio),
      ),
    );
  }
}

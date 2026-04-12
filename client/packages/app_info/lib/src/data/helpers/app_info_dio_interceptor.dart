import 'package:app_info/src/domain/domain.dart';
import 'package:dio/dio.dart';

final class AppInfoDioInterceptor extends InterceptorsWrapper {
  // ignore: unused_field
  final Dio _dio;
  final IAppInfoRepository _appInfoRepository;

  AppInfoDioInterceptor(Dio dio, IAppInfoRepository appInfoRepository)
      : _dio = dio,
        _appInfoRepository = appInfoRepository;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final appInfo = await _appInfoRepository.fetch();
    options.headers.addAll({
      'build-number': appInfo.package.buildNumber,
      'version': appInfo.package.version,
      'package-name': appInfo.package.packageName,
      'device-name': appInfo.device.name,
      'device-family': appInfo.device.family,
      'device-system-name': appInfo.device.systemName,
      'device-system-version': appInfo.device.systemVersion,
    });
    return handler.next(options);
  }
}

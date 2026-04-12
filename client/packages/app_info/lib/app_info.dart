library app_info;

import 'package:app_info/src/data/data.dart';
import 'package:app_info/src/di/di.dart';
import 'package:app_info/src/domain/domain.dart';
import 'package:common/common.dart';
import 'package:dio/dio.dart';

export 'src/application/application.dart'
    show AppInfoBlocListener, AppInfoScope;
export 'src/data/data.dart' show IPackageInfoPlatformDatasource;
export 'src/domain/domain.dart' show IAppInfoRepository, AppInfoEntity;

abstract final class AppInfoModule {
  static Future<void> init({required GetIt locator}) async {
    await AppInfoDI.init(
      locator: locator,
    );
    final repository = locator.get<IAppInfoRepository>();
    await repository.fetch();
    final dio = locator.get<Dio>();
    dio.interceptors.add(AppInfoDioInterceptor(dio, repository));
  }
}

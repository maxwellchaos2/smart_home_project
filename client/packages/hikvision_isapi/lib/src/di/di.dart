import 'package:common/common.dart';
import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';

abstract final class HikvisionISAPIDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));

    locator.registerLazySingleton(() => getContentMgmtRepo(locator: locator));

    locator.registerLazySingleton(() => getCameraArchiveRepo(locator: locator));
  }

  static IAccessControlRepository getRepo({
    required GetIt locator,
  }) {
    return AccessControlRepositoryImpl(
      remoteSource: AccessControlRemoteDatasourceImpl(
        client: AccessControlApiClientImpl(),
      ),
    );
  }

  static IContentMgmtRepository getContentMgmtRepo({
    required GetIt locator,
  }) {
    return ContentMgmtRepositoryImpl(
      remoteSource: ContentMgmtRemoteDatasourceImpl(
        client: ContentMgmtApiClientImpl(),
      ),
    );
  }

  static ICameraArchiveRepository getCameraArchiveRepo({
    required GetIt locator,
  }) {
    return CameraArchiveRepositoryImpl(
      remoteSource: ContentMgmtRemoteDatasourceImpl(
        client: ContentMgmtApiClientImpl(),
      ),
    );
  }
}

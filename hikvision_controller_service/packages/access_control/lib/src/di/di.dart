import 'package:access_control/src/data/data.dart';
import 'package:access_control/src/domain/domain.dart';
import 'package:common/common.dart';

abstract final class AccessControlDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IAccessControlRepository getRepo({required GetIt locator}) {
    return AccessControlRepositoryImpl(
      remoteSource: AccessControlRemoteDatasourceImpl(
        client: AccessControlApiClientImpl(client: locator.get()),
      ),
    );
  }
}

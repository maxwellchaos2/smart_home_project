import 'package:common/common.dart';
import 'package:isapi/src/data/data.dart';

abstract final class ISAPIDI {
  static Future<void> init(
      {required GetIt locator,
      required String host,
      required String username,
      required String password}) async {
    locator.registerLazySingleton(() => getRepo(
        locator: locator, host: host, username: username, password: password));
  }

  static IISAPIClient getRepo({
    required GetIt locator,
    required String host,
    required String username,
    required String password,
  }) {
    return ISAPIClientImpl(
      username: username,
      password: password,
      host: host,
    );
  }
}

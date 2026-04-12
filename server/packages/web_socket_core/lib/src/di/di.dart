import 'package:common/common.dart';
import 'package:web_socket_core/src/data/repositories/web_socket_repository.dart';
import 'package:web_socket_core/web_socket_core.dart';

abstract final class WebSocketCoreDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IWebSocketRepository getRepo({
    required GetIt locator,
  }) {
    return WebSocketRepositoryImpl();
  }
}

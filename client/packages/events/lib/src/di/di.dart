import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:events/src/data/data.dart';
import 'package:events/src/domain/repositories/repositories.dart';

abstract final class EventsDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IEventsRepository getRepo({required GetIt locator}) {
    return EventsRepositoryImpl(
      remoteSource: EventsRemoteDatasourceImpl(
        client: EventsWebsocketClientImpl(
          uri: Uri.parse(locator.get<IAppConfig>().wsUrl),
          getAuthToken: () async {
            final token =
                await locator.get<IAuthTokenRepository>().fetchToken();
            return token!.accessToken;
          },
        ),
      ),
    );
  }
}

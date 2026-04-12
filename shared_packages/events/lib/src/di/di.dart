import 'package:common/common.dart';
import 'package:events/src/data/data.dart';
import 'package:events/src/domain/repositories/repositories.dart';

abstract final class EventsDI {
  static Future<void> init(
      {required GetIt locator,
      required String wsUrl,
      String? authToken}) async {
    locator.registerLazySingleton(
        () => getRepo(locator: locator, wsUrl: wsUrl, authToken: authToken));
  }

  static IEventsRepository getRepo(
      {required GetIt locator, required String wsUrl, String? authToken}) {
    return EventsRepositoryImpl(
      remoteSource: EventsRemoteDatasourceImpl(
        client: EventsWebsocketClientImpl(
          uri: Uri.parse(
              '${wsUrl.replaceFirst('http', 'ws')}/ws${authToken != null ? '?authToken=$authToken' : ''}'),
        ),
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:events/events.dart';
import 'package:events/src/data/data.dart';

abstract final class EventsDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IEventsRepository getRepo({
    required GetIt locator,
  }) {
    return EventsRepositoryImpl(
      databaseSource: EventsDatabaseDatasourceImpl(
        client: EventsDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

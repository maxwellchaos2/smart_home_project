import 'package:common/common.dart';
import 'package:rooms/src/data/data.dart';
import 'package:rooms/src/domain/domain.dart';

abstract final class RoomsDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IRoomsRepository getRepo({
    required GetIt locator,
  }) {
    return RoomsRepositoryImpl(
      databaseSource: RoomsDatabaseDatasourceImpl(
        client: RoomsDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:floors/src/data/data.dart';
import 'package:floors/src/domain/domain.dart';

abstract final class FloorsDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IFloorsRepository getRepo({
    required GetIt locator,
  }) {
    return FloorsRepositoryImpl(
      databaseSource: FloorsDatabaseDatasourceImpl(
        client: FloorsDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

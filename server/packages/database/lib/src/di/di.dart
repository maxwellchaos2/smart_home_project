import 'package:common/common.dart';
import 'package:database/src/data/data.dart';
import 'package:database/src/domain/repositories/repositories.dart';
import 'package:postgres/postgres.dart';

abstract final class DatabseDI {
  static Future<void> init({
    required GetIt locator,
    required Connection connection,
  }) async {
    locator.registerLazySingleton(
        () => getRepo(connection: connection, locator: locator));
  }

  static IDatabaseRepository getRepo(
      {required Connection connection, required GetIt locator}) {
    return DatabaseRepositoryImpl(
      source: DatabaseDatasourceImpl(
        client: PostgresClientImpl(connection: connection),
      ),
    );
  }
}

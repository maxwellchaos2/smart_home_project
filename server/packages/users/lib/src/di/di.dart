import 'package:common/common.dart';
import 'package:users/src/data/data.dart';
import 'package:users/src/domain/domain.dart';

abstract final class UsersDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IUsersRepository getRepo({
    required GetIt locator,
  }) {
    return UsersRepositoryImpl(
      databaseSource: UsersDatabaseDatasourceImpl(
        client: UsersDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

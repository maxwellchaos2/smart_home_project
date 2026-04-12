import 'package:common/common.dart';
import 'package:inout_scenario/src/data/data.dart';
import 'package:inout_scenario/src/domain/domain.dart';

abstract final class InOutScenarioDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IInOutScenarioRepository getRepo({
    required GetIt locator,
  }) {
    return InOutScenarioRepositoryImpl(
      databaseSource: InOutScenarioDatabaseDatasourceImpl(
        client: InOutScenarioDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

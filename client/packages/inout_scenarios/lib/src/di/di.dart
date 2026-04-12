import 'package:common/common.dart';
import 'package:inout_scenarios/src/data/data.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

abstract final class InOutScenariosDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IInOutScenariosRepository getRepo({required GetIt locator}) {
    return InOutScenariosRepositoryImpl(
      remoteSource: InOutScenariosRemoteDatasourceImpl(
        client: InOutScenariosApiClient(locator.get()),
      ),
    );
  }
}

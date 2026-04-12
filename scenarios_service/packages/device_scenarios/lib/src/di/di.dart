import 'package:common/common.dart';
import 'package:device_scenarios/src/application/application.dart';
import 'package:device_scenarios/src/data/data.dart';
import 'package:device_scenarios/src/domain/domain.dart';

abstract final class DeviceScenariosDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
    locator.registerLazySingleton(() => DeviceScenarioExecutorService());
    locator.registerLazySingleton(
      () => Input2StateChangeHandler(
        executorService: locator.get(),
        scenarioRepository: locator.get(),
      ),
    );
    locator.registerLazySingleton(
      () => DeviceStateChangeHandler(
        executorService: locator.get(),
        scenarioRepository: locator.get(),
      ),
    );
  }

  static IDeviceScenariosRepository getRepo({required GetIt locator}) {
    return DeviceScenariosRepositoryImpl(
      remoteSource: DeviceScenariosRemoteDatasourceImpl(
        client: DeviceScenariosApiClient(locator.get()),
      ),
    );
  }
}

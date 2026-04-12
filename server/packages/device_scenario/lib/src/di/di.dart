import 'package:common/common.dart';
import 'package:device_scenario/src/data/data.dart';
import 'package:device_scenario/src/domain/domain.dart';

abstract final class DeviceScenarioDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IDeviceScenarioRepository getRepo({
    required GetIt locator,
  }) {
    return DeviceScenarioRepositoryImpl(
      databaseSource: DeviceScenarioDatabaseDatasourceImpl(
        client: DeviceScenarioDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

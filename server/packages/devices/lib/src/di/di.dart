import 'package:common/common.dart';
import 'package:devices/src/data/data.dart';
import 'package:devices/src/domain/domain.dart';

abstract final class DevicesDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IDevicesRepository getRepo({
    required GetIt locator,
  }) {
    return DevicesRepositoryImpl(
      databaseSource: DeviceDatabaseDatasourceImpl(
        client: DevicesDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
      webSocketRepository: locator.get(),
    );
  }
}

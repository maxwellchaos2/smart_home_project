import 'package:common/common.dart';
import 'package:device_positions/src/data/data.dart';
import 'package:device_positions/src/domain/domain.dart';

abstract final class DevicePositionsDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IDevicePositionsRepository getRepo({required GetIt locator}) {
    return DevicePositionsRepositoryImpl(
      remoteSource: DevicePositionsRemoteDatasourceImpl(
        client: DevicePositionsApiClient(locator.get()),
      ),
    );
  }
}

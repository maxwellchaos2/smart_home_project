import 'package:common/common.dart';
import 'package:zigbee_devices/src/data/data.dart';
import 'package:zigbee_devices/src/domain/domain.dart';

abstract final class ZigbeeDevicesDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IZigbeeDevicesRepository getRepo({required GetIt locator}) {
    return ZigbeeDevicesRepositoryImpl(
      eventsRepository: locator.get(),
    );
  }
}

library;

import 'package:common/common.dart';
import 'package:device_scenarios/src/di/di.dart';

export 'src/application/application.dart'
    show
        Input2StateChangeHandler,
        DeviceStateChangeHandler,
        DeviceScenarioExecutorService;
export 'src/domain/domain.dart' show IDeviceScenariosRepository;

abstract final class DeviceScenariosModule {
  static Future<void> init({required GetIt locator}) async {
    await DeviceScenariosDI.init(locator: locator);
  }
}

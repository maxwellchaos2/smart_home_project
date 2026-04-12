library;

import 'package:common/common.dart';
import 'package:device_scenarios/src/di/di.dart';

export 'src/application/application.dart'
    show
        DeviceScenariosScreen,
        DeviceScenariosScope,
        DeviceScenariosBlocListener,
        DeviceScenarioOnMonitor;
export 'src/domain/domain.dart' show DeviceScenarioEntity;

abstract final class DeviceScenariosModule {
  static Future<void> init({required GetIt locator}) async {
    await DeviceScenariosDI.init(locator: locator);
  }
}

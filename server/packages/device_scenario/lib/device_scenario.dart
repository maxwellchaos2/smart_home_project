library;

import 'package:common/common.dart';
import 'package:device_scenario/src/application/application.dart';
import 'package:shelf_router/shelf_router.dart';

import 'src/di/di.dart';

export 'src/domain/domain.dart' show IDeviceScenarioRepository;

abstract final class DeviceScenarioModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await DeviceScenarioDI.init(
      locator: locator,
    );
  }
}

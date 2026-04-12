library;

import 'package:common/common.dart';
import 'package:device_positions/src/application/application.dart';
import 'package:device_positions/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/domain/domain.dart' show IDevicePositionsRepository;

abstract final class DevicePositionsModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await DevicePositionsDI.init(
      locator: locator,
    );
  }
}

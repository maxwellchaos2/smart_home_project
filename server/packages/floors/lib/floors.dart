library;

import 'package:common/common.dart';
import 'package:floors/src/application/application.dart';
import 'package:floors/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/domain/domain.dart' show IFloorsRepository;

abstract final class FloorsModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await FloorsDI.init(
      locator: locator,
    );
  }
}

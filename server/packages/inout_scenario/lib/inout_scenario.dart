library;

import 'package:common/common.dart';
import 'package:inout_scenario/src/application/application.dart';
import 'package:shelf_router/shelf_router.dart';

import 'src/di/di.dart';

export 'src/domain/domain.dart' show IInOutScenarioRepository;

abstract final class InOutScenarioModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await InOutScenarioDI.init(
      locator: locator,
    );
  }
}

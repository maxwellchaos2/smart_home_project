library;

import 'package:common/common.dart';
import 'package:inout_scenarios/src/di/di.dart';

export 'src/application/application.dart'
    show
        InputStateChangeHandler,
        OutputStateChangeHandler,
        InOutScenarioExecutorService;

abstract final class InOutScenariosModule {
  static Future<void> init({required GetIt locator}) async {
    await InOutScenariosDI.init(locator: locator);
  }
}

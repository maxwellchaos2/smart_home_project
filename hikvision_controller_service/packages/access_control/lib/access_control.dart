library;

import 'package:access_control/src/di/di.dart';
import 'package:common/common.dart';

export 'src/domain/domain.dart' show IOpenDoorController, ICloseDoorController;

abstract final class AccessControlModule {
  static Future<void> init({required GetIt locator}) async {
    await AccessControlDI.init(locator: locator);
  }
}

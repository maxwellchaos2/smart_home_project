library;

import 'package:common/common.dart';
import 'package:device_positions/src/di/di.dart';

export 'src/application/application.dart'
    show DevicePositionsScope, DevicePositionsBlocListener;
export 'src/domain/domain.dart'
    show DevicePositionEntity, $DevicePositionEntityCopyWith;

abstract final class DevicePositionsModule {
  static Future<void> init({required GetIt locator}) async {
    await DevicePositionsDI.init(locator: locator);
  }
}

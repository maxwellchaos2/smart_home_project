library;

import 'package:common/common.dart';
import 'package:floors/src/di/di.dart';

export 'src/application/application.dart'
    show FloorsScope, FloorsBlocListener, FloorLayout;
export 'src/domain/domain.dart' show FloorEntity, $FloorEntityCopyWith;

abstract final class FloorsModule {
  static Future<void> init({required GetIt locator}) async {
    await FloorsDI.init(locator: locator);
  }
}

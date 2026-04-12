library;

import 'package:common/common.dart';
import 'package:rooms/src/di/di.dart';

export 'src/application/application.dart'
    show RoomsScope, RoomsBlocListener, RoomsScreen;
export 'src/data/data.dart' show RoomModel, RoomMapper;
export 'src/domain/domain.dart' show RoomEntity, $RoomEntityCopyWith;

abstract final class RoomsModule {
  static Future<void> init({required GetIt locator}) async {
    await RoomsDI.init(locator: locator);
  }
}

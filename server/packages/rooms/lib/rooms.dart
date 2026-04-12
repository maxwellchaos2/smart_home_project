library;

import 'package:common/common.dart';
import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/application/application.dart'
    show RoomResponseModel, RoomResponseMapper;
export 'src/domain/domain.dart'
    show IRoomsRepository, RoomEntity, $RoomEntityCopyWith;

abstract final class RoomsModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await RoomsDI.init(
      locator: locator,
    );
  }
}

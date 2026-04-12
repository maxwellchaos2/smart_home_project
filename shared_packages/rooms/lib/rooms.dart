library;

import 'package:common/common.dart';
import 'package:rooms/src/di/di.dart';

export 'package:rooms_entities/rooms_entities.dart';

export 'src/domain/domain.dart'
    show
        RoomsBloc,
        RoomsEvent,
        IRoomsRepository,
        IRoomsController,
        ICreateRoomController,
        IDeleteRoomController,
        IUpdateRoomController,
        RoomsState;

abstract final class RoomsModule {
  static Future<void> init({required GetIt locator}) async {
    await RoomsDI.init(locator: locator);
  }
}

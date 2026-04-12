import 'package:common/common.dart';
import 'package:rooms/rooms.dart';

final class RoomsTabController extends TabController {
  RoomsTabController({
    required List<RoomEntity> rooms,
    required super.vsync,
    super.initialIndex = 0,
  })  : _rooms = rooms,
        super(
          length: rooms.length + 1,
        );

  final List<RoomEntity> _rooms;

  RoomEntity? get selectedRoom => index == 0 ? null : _rooms[index - 1];

  RoomEntity? getRoomByIndex(int index) {
    if (index == 0) return null;
    return _rooms[index - 1];
  }
}

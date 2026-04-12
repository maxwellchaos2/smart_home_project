import 'package:common/common.dart';
import 'package:rooms/rooms.dart';

abstract interface class IRoomsRepository {
  Future<List<RoomEntity>> fetchAll({
    required int projectId,
  });

  Future<RoomEntity> createRoom({
    required int projectId,
    required RoomInputEntity input,
  });

  Future<void> deleteRoom({
    required int id,
    required int projectId,
  });

  Future<RoomEntity> updateRoom({
    required int id,
    required RoomInputEntity input,
    required int projectId,
  });

  Stream<List<ChangedEvent<RoomEntity>>> get onChanged;

  void dispose();
}

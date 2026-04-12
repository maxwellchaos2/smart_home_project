import 'package:rooms/src/domain/domain.dart';

abstract interface class IRoomsRepository {
  Future<bool> createTableIfNotExists();

  Future<List<RoomEntity>> fetchAll({required int projectId});

  Future<RoomEntity> fetch({required int id});

  Future<RoomEntity> create({required RoomInputEntity input});

  Future<RoomEntity> update({required int id, required RoomInputEntity input});

  Future<void> delete({required int id});
}

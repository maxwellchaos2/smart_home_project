import 'package:rooms/src/data/data.dart';
import 'package:rooms/src/domain/domain.dart';

abstract interface class IRoomsDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<RoomEntity>> fetchAll({required int projectId});

  Future<RoomEntity> fetchRoom({required int id});

  Future<RoomEntity> createRoom({required RoomInputEntity input});

  Future<RoomEntity> updateRoom(
      {required int id, required RoomInputEntity room});

  Future<void> deleteRoom({required int id});
}

final class RoomsDatabaseDatasourceImpl implements IRoomsDatabaseDatasource {
  const RoomsDatabaseDatasourceImpl({required IRoomsDatabaseClient client})
      : _client = client;

  final IRoomsDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<RoomEntity>> fetchAll({required int projectId}) async {
    final rooms = await _client.fetchAll(projectId: projectId);
    return rooms.map((room) => RoomMapper.toEntity(from: room)).toList();
  }

  @override
  Future<RoomEntity> fetchRoom({required int id}) async {
    final room = await _client.fetch(id: id);
    return RoomMapper.toEntity(from: room);
  }

  @override
  Future<RoomEntity> createRoom({required RoomInputEntity input}) async {
    final room = await _client.createRoom(
      input: RoomInputMapper.toModel(from: input),
    );
    return RoomMapper.toEntity(from: room);
  }

  @override
  Future<RoomEntity> updateRoom(
      {required int id, required RoomInputEntity room}) async {
    final updatedRoom = await _client.updateRoom(
      id: id,
      room: RoomInputMapper.toModel(from: room),
    );
    return RoomMapper.toEntity(from: updatedRoom);
  }

  @override
  Future<void> deleteRoom({required int id}) async {
    await _client.deleteRoom(id: id);
  }
}

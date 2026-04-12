import 'package:rooms/src/data/data.dart';
import 'package:rooms/src/domain/domain.dart';

final class RoomsRepositoryImpl implements IRoomsRepository {
  const RoomsRepositoryImpl({
    required IRoomsDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IRoomsDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<List<RoomEntity>> fetchAll({required int projectId}) async {
    return await _databaseSource.fetchAll(projectId: projectId);
  }

  @override
  Future<RoomEntity> fetch({required int id}) async {
    return await _databaseSource.fetchRoom(id: id);
  }

  @override
  Future<RoomEntity> create({required RoomInputEntity input}) async {
    return await _databaseSource.createRoom(input: input);
  }

  @override
  Future<RoomEntity> update(
      {required int id, required RoomInputEntity input}) async {
    return await _databaseSource.updateRoom(id: id, room: input);
  }

  @override
  Future<void> delete({required int id}) async {
    await _databaseSource.deleteRoom(id: id);
  }
}

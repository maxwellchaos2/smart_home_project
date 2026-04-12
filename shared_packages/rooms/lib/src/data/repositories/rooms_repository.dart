import 'package:common/common.dart';
import 'package:rooms/rooms.dart';
import 'package:rooms/src/data/data.dart';

final class RoomsRepositoryImpl implements IRoomsRepository {
  const RoomsRepositoryImpl({
    required IRoomsRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IRoomsRemoteDatasource _remoteSource;

  @override
  Future<List<RoomEntity>> fetchAll({
    required int projectId,
  }) {
    return _remoteSource.fetchAll(projectId: projectId);
  }

  @override
  Future<RoomEntity> createRoom({
    required int projectId,
    required RoomInputEntity input,
  }) {
    return _remoteSource.createRoom(
      projectId: projectId,
      input: input,
    );
  }

  @override
  Future<void> deleteRoom({
    required int id,
    required int projectId,
  }) {
    return _remoteSource.deleteRoom(
      id: id,
      projectId: projectId,
    );
  }

  @override
  Future<RoomEntity> updateRoom({
    required int id,
    required RoomInputEntity input,
    required int projectId,
  }) {
    return _remoteSource.updateRoom(
      id: id,
      input: input,
      projectId: projectId,
    );
  }

  @override
  Stream<List<ChangedEvent<RoomEntity>>> get onChanged {
    return _remoteSource.onChanged;
  }

  @override
  void dispose() {}
}

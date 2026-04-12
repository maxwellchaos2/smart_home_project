import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:rooms/src/data/data.dart';
import 'package:rooms/src/domain/domain.dart';

abstract interface class IRoomsRemoteDatasource {
  Future<List<RoomEntity>> fetchAll({
    required int projectId,
  });

  Future<RoomEntity> createRoom({
    required int projectId,
    required RoomInputEntity input,
  });

  Future<void> deleteRoom({
    required int projectId,
    required int id,
  });

  Future<RoomEntity> updateRoom({
    required int id,
    required int projectId,
    required RoomInputEntity input,
  });

  Stream<List<ChangedEvent<RoomEntity>>> get onChanged;
}

final class RoomsRemoteDatasourceImpl implements IRoomsRemoteDatasource {
  const RoomsRemoteDatasourceImpl({
    required RoomsApiClient client,
    required IEventsRepository eventsRepository,
  })  : _client = client,
        _eventsRepository = eventsRepository;

  final RoomsApiClient _client;
  final IEventsRepository _eventsRepository;

  @override
  Future<List<RoomEntity>> fetchAll({
    required int projectId,
  }) async {
    try {
      final data = await _client.fetchAll(projectId: projectId);
      return data.map((e) => RoomMapper.toEntity(from: e)).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<RoomEntity> createRoom({
    required int projectId,
    required RoomInputEntity input,
  }) async {
    try {
      final data = await _client.createRoom(
        projectId: projectId,
        input: RoomInputMapper.toModel(from: input),
      );
      return RoomMapper.toEntity(from: data);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<void> deleteRoom({
    required int projectId,
    required int id,
  }) async {
    try {
      await _client.deleteRoom(
        projectId: projectId,
        id: id,
      );
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<RoomEntity> updateRoom({
    required int id,
    required RoomInputEntity input,
    required int projectId,
  }) async {
    try {
      final data = await _client.updateRoom(
        id: id,
        input: RoomInputMapper.toModel(from: input),
        projectId: projectId,
      );
      return RoomMapper.toEntity(from: data);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Stream<List<ChangedEvent<RoomEntity>>> get onChanged =>
      _eventsRepository.onEvents.map(
        (events) => events
            .where(
          (event) => event.maybeMap(
              orElse: () => false,
              roomCreated: (_) => true,
              roomUpdated: (_) => true,
              roomDeleted: (_) => true),
        )
            .map(
          (event) {
            return event.mapOrNull(
              roomCreated: (event) => ChangedEvent.created(event.room),
              roomUpdated: (event) => ChangedEvent.updated(event.room),
              roomDeleted: (event) =>
                  ChangedEvent.deleted(itemId: event.room.id, item: event.room),
            )!;
          },
        ).toList(),
      );
}

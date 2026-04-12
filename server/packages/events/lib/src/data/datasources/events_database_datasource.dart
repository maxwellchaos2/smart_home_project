import 'package:events/src/data/data.dart';
import 'package:events/src/domain/domain.dart';

abstract interface class IEventsDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<EventEntity>> fetchChunk(
      {required EventsSearchInputEntity input});

  Future<EventEntity> createEvent({required EventInputEntity input});
}

final class EventsDatabaseDatasourceImpl implements IEventsDatabaseDatasource {
  const EventsDatabaseDatasourceImpl({required IEventsDatabaseClient client})
      : _client = client;

  final IEventsDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<EventEntity>> fetchChunk(
      {required EventsSearchInputEntity input}) async {
    final events =
        await _client.fetchChunk(limit: input.limit, offset: input.offset);
    return events.map((event) => EventMapper.toEntity(from: event)).toList();
  }

  @override
  Future<EventEntity> createEvent({required EventInputEntity input}) async {
    final e = input.mapOrNull(
      roomCreated: (input) =>
          EventEntity.roomCreated(room: input.room, createdAt: DateTime.now()),
      roomUpdated: (input) =>
          EventEntity.roomUpdated(room: input.room, createdAt: DateTime.now()),
      roomDeleted: (input) =>
          EventEntity.roomDeleted(room: input.room, createdAt: DateTime.now()),
    );
    if (e != null) return e;
    final event =
        await _client.createEvent(input: EventInputMapper.toModel(from: input));
    return EventMapper.toEntity(from: event);
  }
}

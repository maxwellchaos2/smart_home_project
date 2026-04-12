import 'package:events/src/data/data.dart';
import 'package:events/src/domain/domain.dart';

final class EventsRepositoryImpl implements IEventsRepository {
  const EventsRepositoryImpl({
    required IEventsDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IEventsDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<List<EventEntity>> fetchChunk({
    required EventsSearchInputEntity input,
  }) async {
    return await _databaseSource.fetchChunk(input: input);
  }

  @override
  Future<EventEntity> create({
    required EventInputEntity input,
  }) async {
    return await _databaseSource.createEvent(input: input);
  }
}

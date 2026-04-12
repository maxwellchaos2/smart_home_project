import 'package:database/database.dart';
import 'package:events/src/data/data.dart';

abstract interface class IEventsDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<EventModel>> fetchChunk(
      {required int limit, required int offset});

  Future<EventModel> createEvent({required EventInputModel input});
}

final class EventsDatabaseClientImpl implements IEventsDatabaseClient {
  const EventsDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'events';

  @override
  Future<bool> tableExists() async {
    return await _database.repo.tableExists(tableName: tableName);
  }

  @override
  Future<bool> createTable() async {
    return await _database.repo.createTable(
      tableName: tableName,
      columns: [
        'id SERIAL PRIMARY KEY',
        'type VARCHAR(50) NOT NULL',
        'device_id INTEGER NOT NULL',
        'device JSONB NOT NULL',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
      ],
    );
  }

  @override
  Future<List<EventModel>> fetchChunk({
    required int limit,
    required int offset,
  }) async {
    final events = await _database.repo.execute(
      '''
      SELECT * FROM $tableName
      WHERE id > @offset
      ORDER BY id DESC
      LIMIT @limit
      ''',
      parameters: {
        'limit': limit,
        'offset': offset - 1,
      },
    );
    return events.map((event) => EventModel.fromJson(event)).toList();
  }

  @override
  Future<EventModel> createEvent({required EventInputModel input}) async {
    // final inputMap = input.toJson();
    // final event =
    //     await _database.repo.insert(tableName: tableName, input: inputMap);
    // return EventModel.fromJson(event);

    // For simplicity
    return input.map(
      deviceCreated: (input) => EventModel.deviceCreated(
        id: 0,
        deviceId: input.deviceId,
        device: input.device,
        createdAt: DateTime.now(),
      ),
      deviceUpdated: (deviceUpdated) => EventModel.deviceUpdated(
        id: 0,
        deviceId: deviceUpdated.deviceId,
        device: deviceUpdated.device,
        createdAt: DateTime.now(),
      ),
      deviceDeleted: (deviceDeleted) => EventModel.deviceDeleted(
        id: 0,
        deviceId: deviceDeleted.deviceId,
        device: deviceDeleted.device,
        createdAt: DateTime.now(),
      ),
    );
  }
}

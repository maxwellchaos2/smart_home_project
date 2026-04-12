import 'package:database/database.dart';
import 'package:rooms/src/data/data.dart';

abstract interface class IRoomsDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<RoomModel>> fetchAll({required int projectId});

  Future<RoomModel> fetch({required int id});

  Future<RoomModel> createRoom({required RoomInputModel input});

  Future<RoomModel> updateRoom({required int id, required RoomInputModel room});

  Future<void> deleteRoom({required int id});
}

final class RoomsDatabaseClientImpl implements IRoomsDatabaseClient {
  const RoomsDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'rooms';

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
        'name VARCHAR(100) NOT NULL',
        'floor_id INT REFERENCES floors(id) ON DELETE CASCADE',
        'plan_media_path TEXT',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
      ],
    );
  }

  @override
  Future<List<RoomModel>> fetchAll({required int projectId}) async {
    final rooms = await _database.repo.execute(
      '''
      SELECT r.*, f.project_id AS project_id
      FROM rooms r
      JOIN floors f ON r.floor_id = f.id
      JOIN projects p ON f.project_id = p.id
      WHERE p.id = @projectId
      ''',
      parameters: {
        'projectId': projectId,
      },
    );
    return rooms.map((room) => RoomModel.fromJson(room)).toList();
  }

  @override
  Future<RoomModel> fetch({required int id}) async {
    final room = await _database.repo.execute('''
      SELECT r.*, f.project_id AS project_id
      FROM rooms r
      JOIN floors f ON r.floor_id = f.id
      WHERE r.id = @id
      LIMIT 1
    ''', parameters: {
      'id': id,
    });
    return RoomModel.fromJson(room.first);
  }

  @override
  Future<RoomModel> createRoom({required RoomInputModel input}) async {
    final inputMap = input.toJson();
    final inserted =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    // Получаем project_id через floors
    final withProject = await _database.repo.execute('''
      SELECT r.*, f.project_id AS project_id
      FROM rooms r
      JOIN floors f ON r.floor_id = f.id
      WHERE r.id = @id
    ''', parameters: {
      'id': inserted['id'],
    });
    return RoomModel.fromJson(withProject.first);
  }

  Future<RoomModel> updateRoom(
      {required int id, required RoomInputModel room}) async {
    final inputMap = room.toJson();

    final updateFields = <String>[];

    for (final field in inputMap.keys) {
      updateFields.add('$field = @$field');
    }

    // Обновляем, затем возвращаем с project_id
    final updateQuery = '''
    UPDATE rooms
    SET  ${updateFields.join(', ')}
    WHERE id = @id
    RETURNING id
  ''';

    final updated = await _database.repo.execute(
      updateQuery,
      parameters: {
        ...inputMap,
        'id': id,
      },
    );

    final withProject = await _database.repo.execute('''
      SELECT r.*, f.project_id AS project_id
      FROM rooms r
      JOIN floors f ON r.floor_id = f.id
      WHERE r.id = @id
    ''', parameters: {
      'id': updated.first['id'],
    });

    return RoomModel.fromJson(withProject.first);
  }

  @override
  Future<void> deleteRoom({required int id}) async {
    await _database.repo.execute(
      '''
    DELETE FROM rooms
    WHERE id = @id
  ''',
      parameters: {
        'id': id,
      },
    );
  }
}

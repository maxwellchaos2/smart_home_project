import 'package:database/database.dart';
import 'package:device_positions/src/data/data.dart';

abstract interface class IDevicePositionsDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<DevicePositionModel>> fetchAll({int? userId});

  Future<DevicePositionModel> createDevicePosition(
      {required DevicePositionInputModel input});

  Future<DevicePositionModel> updateDevicePosition(
      {required int id, required DevicePositionInputModel room});

  Future<void> deleteDevicePosition({required int id});
}

final class DevicePositionsDatabaseClientImpl
    implements IDevicePositionsDatabaseClient {
  const DevicePositionsDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'device_positions';

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
        'x FLOAT NOT NULL',
        'y FLOAT NOT NULL',
        'angle FLOAT NOT NULL',
        'icon_media_path TEXT',
        'disabled_icon_media_path TEXT',
        'device_id INT REFERENCES devices(id) ON DELETE CASCADE',
      ],
    );
  }

  @override
  Future<List<DevicePositionModel>> fetchAll({int? userId}) async {
    final rooms = switch (userId) {
      int userId => await _database.repo.execute(
          '''
      SELECT dp.*
      FROM $tableName dp
      JOIN devices d ON dp.device_id = d.id
      JOIN projects p ON d.project_id = p.id
      WHERE p.user_id = @userId
      ''',
          parameters: {
            'userId': userId,
          },
        ),
      null => await _database.repo.selectAll(tableName: tableName),
    };
    return rooms.map((room) => DevicePositionModel.fromJson(room)).toList();
  }

  @override
  Future<DevicePositionModel> createDevicePosition(
      {required DevicePositionInputModel input}) async {
    final inputMap = input.toJson();
    final room =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return DevicePositionModel.fromJson(room);
  }

  Future<DevicePositionModel> updateDevicePosition(
      {required int id, required DevicePositionInputModel room}) async {
    final inputMap = room.toJson();

    final updateFields = <String>[];

    for (final field in inputMap.keys) {
      updateFields.add('$field = @$field');
    }

    final updateQuery = '''
    UPDATE $tableName
    SET  ${updateFields.join(', ')}
    WHERE id = @id
    RETURNING *
  ''';

    final result = await _database.repo.execute(
      updateQuery,
      parameters: {
        ...inputMap,
        'id': id,
      },
    );

    return DevicePositionModel.fromJson(result.first);
  }

  @override
  Future<void> deleteDevicePosition({required int id}) async {
    await _database.repo.execute(
      '''
    DELETE FROM $tableName
    WHERE id = @id
  ''',
      parameters: {
        'id': id,
      },
    );
  }
}

import 'package:database/database.dart';
import 'package:floors/src/data/data.dart';

abstract interface class IFloorsDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<FloorModel>> fetchAll({required int projectId});

  Future<FloorModel> createFloor({required FloorInputModel input});
}

final class FloorsDatabaseClientImpl implements IFloorsDatabaseClient {
  const FloorsDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'floors';

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
        'project_id INT REFERENCES projects(id) ON DELETE CASCADE',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'plan_media_path TEXT',
      ],
    );
  }

  @override
  Future<List<FloorModel>> fetchAll({required int projectId}) async {
    final floors = await _database.repo.execute(
      '''
    SELECT f.*
    FROM floors f
    JOIN projects p ON f.project_id = p.id
    WHERE p.id = @projectId
    ''',
      parameters: {
        'projectId': projectId,
      },
    );
    return floors.map((floor) => FloorModel.fromJson(floor)).toList();
  }

  @override
  Future<FloorModel> createFloor({required FloorInputModel input}) async {
    final inputMap = input.toJson();
    final floor =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return FloorModel.fromJson(floor);
  }
}

import 'package:database/database.dart';
import 'package:projects/src/data/models/models.dart';

abstract class IProjectsDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<ProjectModel>> fetchAll({required int userId});
  Future<ProjectModel> fetch({required int id});
  Future<ProjectModel> createProject({required ProjectInputModel input});

  Future<ProjectModel?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  });
}

class ProjectsDatabaseClientImpl implements IProjectsDatabaseClient {
  ProjectsDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'projects';

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
        'name VARCHAR(100) NOT NULL UNIQUE',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'has_yandex_auth BOOLEAN NOT NULL DEFAULT FALSE',
        'user_id INT REFERENCES users(id) ON DELETE CASCADE',
      ],
    );
  }

  @override
  Future<ProjectModel> fetch({required int id}) async {
    final project = await _database.repo.selectOneByColumn(
      tableName: tableName,
      column: 'id',
      value: id,
    );
    return ProjectModel.fromJson(project!);
  }

  @override
  Future<List<ProjectModel>> fetchAll({required int userId}) async {
    final projects = await _database.repo.execute(
      '''
      SELECT * FROM $tableName WHERE user_id = @userId
      ''',
      parameters: {
        'userId': userId,
      },
    );
    return projects.map((project) => ProjectModel.fromJson(project)).toList();
  }

  @override
  Future<ProjectModel> createProject({required ProjectInputModel input}) async {
    final inputMap = input.toJson();
    final project =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return ProjectModel.fromJson(project);
  }

  @override
  Future<ProjectModel?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  }) async {
    final project = await _database.repo.execute(
      'UPDATE $tableName SET has_yandex_auth = @has_yandex_auth WHERE id = @id RETURNING *',
      parameters: {
        'id': id,
        'has_yandex_auth': hasYandexAuth,
      },
    );
    return ProjectModel.fromJson(project.first);
  }
}

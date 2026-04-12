import 'package:database/database.dart';
import 'package:yandex_auth/src/data/data.dart';

abstract interface class IYandexAuthTokenDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<YandexAuthTokenModel> fetchByProject({required int projectId});
  Future<YandexAuthTokenModel> create({required YandexAuthTokenModel input});

  Future<void> delete({required int projectId});
}

final class AuthCodeDatabaseClientImpl
    implements IYandexAuthTokenDatabaseClient {
  const AuthCodeDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'yandex_auth_token';

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
        'access_token VARCHAR(255) NOT NULL',
        'refresh_token VARCHAR(255) NOT NULL',
        'expires_at TIMESTAMP NOT NULL',
        'project_id INT REFERENCES projects(id) ON DELETE CASCADE',
      ],
    );
  }

  Future<YandexAuthTokenModel> fetchByProject({required int projectId}) async {
    final project = await _database.repo.selectOneByColumn(
      tableName: tableName,
      column: 'project_id',
      value: projectId,
    );
    return YandexAuthTokenModel.fromJson(project!);
  }

  @override
  Future<YandexAuthTokenModel> create(
      {required YandexAuthTokenModel input}) async {
    final inputMap = input.toJson();
    final user =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return YandexAuthTokenModel.fromJson(user);
  }

  @override
  Future<void> delete({required int projectId}) async {
    await _database.repo.execute(
      'DELETE FROM $tableName WHERE project_id = @project_id',
      parameters: {
        'project_id': projectId,
      },
    );
  }
}

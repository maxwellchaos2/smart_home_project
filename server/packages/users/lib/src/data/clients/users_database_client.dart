import 'package:database/database.dart';
import 'package:users/src/data/data.dart';

abstract interface class IUsersDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<UserModel>> fetchAll();
  Future<UserModel> fetch({required int id});
  Future<UserModel?> fetchByUsername({required String username});
  Future<UserModel> createUser({required UserInputModel input});

  Future<UserModel?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  });
}

final class UsersDatabaseClientImpl implements IUsersDatabaseClient {
  const UsersDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'users';

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
        'type VARCHAR(50) NOT NULL',
        'username VARCHAR(100) NOT NULL UNIQUE',
        'password_hash VARCHAR(255) NOT NULL',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'has_yandex_auth BOOLEAN NOT NULL DEFAULT FALSE',
        'email VARCHAR(100)',
      ],
    );
  }

  @override
  Future<List<UserModel>> fetchAll() async {
    final users = await _database.repo.selectAll(tableName: tableName);
    return users.map((user) => UserModel.fromJson(user)).toList();
  }

  Future<UserModel> fetch({required int id}) async {
    /// add projects_id
    final user = await _database.repo.execute(
      '''SELECT u.*,
       COALESCE(array_agg(p.id) FILTER (WHERE p.id IS NOT NULL), '{}') AS projects_id
FROM $tableName u
LEFT JOIN projects p ON p.user_id = u.id
WHERE u.id = @id
GROUP BY u.id''',
      parameters: {'id': id},
    );
    return UserModel.fromJson(user.first);
  }

  @override
  Future<UserModel?> fetchByUsername({required String username}) async {
    final user = await _database.repo.execute(
      '''SELECT u.*,
       COALESCE(array_agg(p.id) FILTER (WHERE p.id IS NOT NULL), '{}') AS projects_id
FROM $tableName u
LEFT JOIN projects p ON p.user_id = u.id
WHERE u.username = @username
GROUP BY u.id''',
      parameters: {'username': username},
    );
    if (user.isEmpty) return null;
    return UserModel.fromJson(user.first);
  }

  @override
  Future<UserModel> createUser({required UserInputModel input}) async {
    final inputMap = input.toJson();
    final user = await _database.repo.execute(
      '''
      INSERT INTO $tableName (name, type, username, password_hash, email)
      VALUES (@name, @type, @username, @password_hash, @email)
      RETURNING *
      ''',
      parameters: inputMap,
    );
    user.first['projects_id'] = <int>[];
    return UserModel.fromJson(user.first);
  }

  @override
  Future<UserModel?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  }) async {
    final user = await _database.repo.execute(
      '''
      WITH updated AS (
        UPDATE $tableName
        SET has_yandex_auth = @has_yandex_auth, updated_at = CURRENT_TIMESTAMP
        WHERE id = @id
        RETURNING *
      )
      SELECT u.*, COALESCE(array_agg(p.id) FILTER (WHERE p.id IS NOT NULL), '{}') AS projects_id
      FROM updated u
      LEFT JOIN projects p ON p.user_id = u.id
      GROUP BY u.id
      ''',
      parameters: {
        'id': id,
        'has_yandex_auth': hasYandexAuth,
      },
    );
    return UserModel.fromJson(user.first);
  }
}

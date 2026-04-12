import 'package:database/database.dart';
import 'package:refresh_token/src/data/data.dart';

abstract interface class IRefreshTokenDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<RefreshTokenModel>> fetchAll();

  Future<RefreshTokenModel> fetchByToken({required String token});

  Future<RefreshTokenModel> createRefreshToken(
      {required RefreshTokenInputModel input});

  Future<void> deleteRefreshToken({required String token});
}

final class RefreshTokenDatabaseClientImpl
    implements IRefreshTokenDatabaseClient {
  const RefreshTokenDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'refresh_tokens';

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
        'token uuid NOT NULL',
        'user_id INTEGER REFERENCES users(id) ON DELETE CASCADE',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'expires_at TIMESTAMP NOT NULL',
      ],
    );
  }

  @override
  Future<List<RefreshTokenModel>> fetchAll() async {
    final tokens = await _database.repo.selectAll(tableName: tableName);
    return tokens.map((token) => RefreshTokenModel.fromJson(token)).toList();
  }

  @override
  Future<RefreshTokenModel> fetchByToken({required String token}) async {
    final tokenMap = await _database.repo.selectOneByColumn(
      tableName: tableName,
      column: 'token',
      value: token,
    );
    return RefreshTokenModel.fromJson(tokenMap!);
  }

  @override
  Future<RefreshTokenModel> createRefreshToken(
      {required RefreshTokenInputModel input}) async {
    final inputMap = input.toJson();
    final token =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return RefreshTokenModel.fromJson(token);
  }

  @override
  Future<void> deleteRefreshToken({required String token}) async {
    await _database.repo.execute(
      'DELETE FROM $tableName WHERE token = @token',
      parameters: {
        'token': token,
      },
    );
  }
}

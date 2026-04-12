import 'package:database/database.dart';
import 'package:oauth/src/data/data.dart';

abstract interface class IAuthCodeDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<AuthCodeModel> fetchByCode({required String code});
  Future<AuthCodeModel> create({required AuthCodeModel input});
}

final class AuthCodeDatabaseClientImpl implements IAuthCodeDatabaseClient {
  const AuthCodeDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'auth_code';

  @override
  Future<bool> tableExists() async {
    return await _database.repo.tableExists(tableName: tableName);
  }

  @override
  Future<bool> createTable() async {
    return await _database.repo.createTable(
      tableName: tableName,
      columns: [
        'code VARCHAR(100) PRIMARY KEY',
        'client_id VARCHAR(100) NOT NULL',
        'user_id INT REFERENCES users(id) ON DELETE CASCADE',
        'expires_at TIMESTAMP NOT NULL',
      ],
    );
  }

  Future<AuthCodeModel> fetchByCode({required String code}) async {
    final user = await _database.repo.selectOneByColumn(
      tableName: tableName,
      column: 'code',
      value: code,
    );
    return AuthCodeModel.fromJson(user!);
  }

  @override
  Future<AuthCodeModel> create({required AuthCodeModel input}) async {
    final inputMap = input.toJson();
    final user =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return AuthCodeModel.fromJson(user);
  }
}

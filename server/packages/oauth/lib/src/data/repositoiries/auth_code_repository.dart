import 'package:oauth/src/data/data.dart';
import 'package:oauth/src/domain/domain.dart';

final class AuthCodeRepositoryImpl implements IAuthCodeRepository {
  const AuthCodeRepositoryImpl({
    required IAuthCodeDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IAuthCodeDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() => _databaseSource.createTable();

  @override
  Future<AuthCodeEntity> create({required AuthCodeEntity input}) async {
    return await _databaseSource.createAuthCode(input: input);
  }

  @override
  Future<AuthCodeEntity?> findByCode(String code) async {
    return await _databaseSource.fetchByCode(code: code);
  }
}

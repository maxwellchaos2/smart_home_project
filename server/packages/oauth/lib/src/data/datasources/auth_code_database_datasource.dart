import 'package:oauth/src/data/data.dart';
import 'package:oauth/src/domain/domain.dart';

abstract interface class IAuthCodeDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<AuthCodeEntity> fetchByCode({required String code});
  Future<AuthCodeEntity> createAuthCode({required AuthCodeEntity input});
}

final class AuthCodeDatabaseDatasourceImpl
    implements IAuthCodeDatabaseDatasource {
  const AuthCodeDatabaseDatasourceImpl(
      {required IAuthCodeDatabaseClient client})
      : _client = client;

  final IAuthCodeDatabaseClient _client;

  @override
  Future<bool> tableExists() => _client.tableExists();

  @override
  Future<bool> createTable() => _client.createTable();

  @override
  Future<AuthCodeEntity> fetchByCode({required String code}) async {
    final model = await _client.fetchByCode(code: code);
    return AuthCodeMapper.toEntity(from: model);
  }

  @override
  Future<AuthCodeEntity> createAuthCode({required AuthCodeEntity input}) async {
    final model = AuthCodeMapper.toModel(from: input);
    final newModel = await _client.create(input: model);
    return AuthCodeMapper.toEntity(from: newModel);
  }
}

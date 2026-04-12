import 'package:auth_token/src/data/data.dart';
import 'package:auth_token/src/domain/domain.dart';

abstract interface class IAuthTokenLocalDatasource {
  Future<AuthTokenEntity?> fetch();
  Future<void> save({required AuthTokenEntity token});
  Future<void> remove();
}

final class AuthTokenLocalDatasourceImpl implements IAuthTokenLocalDatasource {
  const AuthTokenLocalDatasourceImpl(
      {required IAuthTokenLocalStorageClient client})
      : _client = client;

  final IAuthTokenLocalStorageClient _client;

  @override
  Future<AuthTokenEntity?> fetch() async {
    final token = await _client.readToken();
    if (token == null) return null;
    return AuthTokenMapper.toEntity(from: token);
  }

  @override
  Future<void> save({required AuthTokenEntity token}) async {
    await _client.writeToken(token: AuthTokenMapper.toModel(from: token));
  }

  @override
  Future<void> remove() async {
    await _client.removeToken();
  }
}

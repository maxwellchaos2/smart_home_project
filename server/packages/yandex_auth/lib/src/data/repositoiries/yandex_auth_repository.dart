import 'package:yandex_auth/src/data/data.dart';
import 'package:yandex_auth/src/domain/domain.dart';

final class YandexAuthRepositoryImpl implements IYandexAuthRepository {
  const YandexAuthRepositoryImpl({
    required IYandexAuthTokenDatabaseDatasource databaseSource,
    required IYandexAuthRemoteDatasource remoteSource,
  })  : _databaseSource = databaseSource,
        _remoteSource = remoteSource;

  final IYandexAuthTokenDatabaseDatasource _databaseSource;
  final IYandexAuthRemoteDatasource _remoteSource;

  @override
  Future<bool> createTableIfNotExists() => _databaseSource.createTable();

  @override
  Future<YandexAuthTokenEntity?> fetchToken({required int projectId}) async {
    return await _databaseSource.fetchToken(projectId: projectId);
  }

  @override
  Future<YandexAuthTokenEntity> saveToken({
    required YandexAuthTokenEntity input,
  }) async {
    return await _databaseSource.saveToken(input: input);
  }

  @override
  Future<YandexAuthTokenEntity> refreshToken({
    required YandexAuthTokenEntity input,
  }) async {
    return await _databaseSource.saveToken(input: input);
  }

  @override
  Future<YandexAuthTokenEntity> codeToToken({required String code}) {
    return _remoteSource.fetchToken(code: code);
  }

  @override
  Future<void> revokeToken({
    required int projectId,
  }) async {
    final token = await _databaseSource.fetchToken(projectId: projectId);
    if (token != null) {
      try {
        await _remoteSource.revokeToken(accessToken: token.accessToken);
      } catch (e) {
        print(e);
      }
      await _databaseSource.delete(projectId: projectId);
    }
  }
}

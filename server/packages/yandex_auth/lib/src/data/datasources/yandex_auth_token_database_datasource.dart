import 'package:yandex_auth/src/data/data.dart';
import 'package:yandex_auth/src/domain/domain.dart';

abstract interface class IYandexAuthTokenDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<YandexAuthTokenEntity?> fetchToken({
    required int projectId,
  });

  Future<YandexAuthTokenEntity> saveToken({
    required YandexAuthTokenEntity input,
  });

  Future<void> delete({
    required int projectId,
  });
}

final class YandexAuthTokenDatabaseDatasourceImpl
    implements IYandexAuthTokenDatabaseDatasource {
  const YandexAuthTokenDatabaseDatasourceImpl(
      {required IYandexAuthTokenDatabaseClient client})
      : _client = client;

  final IYandexAuthTokenDatabaseClient _client;

  @override
  Future<bool> tableExists() => _client.tableExists();

  @override
  Future<bool> createTable() => _client.createTable();

  @override
  Future<YandexAuthTokenEntity> fetchToken({required int projectId}) async {
    final model = await _client.fetchByProject(projectId: projectId);
    return YandexAuthTokenMapper.toEntity(from: model);
  }

  @override
  Future<YandexAuthTokenEntity> saveToken(
      {required YandexAuthTokenEntity input}) async {
    final model = YandexAuthTokenMapper.toModel(from: input);
    final newModel = await _client.create(input: model);
    return YandexAuthTokenMapper.toEntity(from: newModel);
  }

  @override
  Future<void> delete({required int projectId}) async {
    await _client.delete(projectId: projectId);
  }
}

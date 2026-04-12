import 'package:refresh_token/src/data/data.dart';
import 'package:refresh_token/src/domain/domain.dart';
import 'package:uuid/uuid.dart';

abstract interface class IRefreshTokenDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<RefreshTokenEntity>> fetchAll();
  Future<RefreshTokenEntity> fetchByToken({required String token});

  Future<RefreshTokenEntity> createRefreshToken(
      {required RefreshTokenInputEntity input});
  Future<void> deleteRefreshToken({required String token});
}

final class RefreshTokenDatabaseDatasourceImpl
    implements IRefreshTokenDatabaseDatasource {
  const RefreshTokenDatabaseDatasourceImpl(
      {required IRefreshTokenDatabaseClient client})
      : _client = client;

  final IRefreshTokenDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<RefreshTokenEntity>> fetchAll() async {
    final tokens = await _client.fetchAll();
    return tokens
        .map((token) => RefreshTokenMapper.toEntity(from: token))
        .toList();
  }

  @override
  Future<RefreshTokenEntity> fetchByToken({required String token}) async {
    final tokenModel = await _client.fetchByToken(token: token);
    return RefreshTokenMapper.toEntity(from: tokenModel);
  }

  @override
  Future<RefreshTokenEntity> createRefreshToken(
      {required RefreshTokenInputEntity input}) async {
    final inputModel = RefreshTokenInputMapper.toModel(
      from: input,
      token: Uuid().v4(),
      expiresAt: DateTime.now().add(const Duration(days: 30)),
    );
    final token = await _client.createRefreshToken(input: inputModel);
    return RefreshTokenMapper.toEntity(from: token);
  }

  @override
  Future<void> deleteRefreshToken({required String token}) async {
    await _client.deleteRefreshToken(token: token);
  }
}

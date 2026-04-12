import 'package:refresh_token/src/data/data.dart';
import 'package:refresh_token/src/domain/domain.dart';

final class RefreshTokenRepositoryImpl implements IRefreshTokenRepository {
  const RefreshTokenRepositoryImpl({
    required IRefreshTokenDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IRefreshTokenDatabaseDatasource _databaseSource;

  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<RefreshTokenEntity> create({
    required RefreshTokenInputEntity input,
  }) async {
    return await _databaseSource.createRefreshToken(input: input);
  }

  @override
  Future<RefreshTokenEntity> fetchByToken({
    required String refreshToken,
  }) async {
    return await _databaseSource.fetchByToken(token: refreshToken);
  }

  @override
  Future<void> delete({
    required String refreshToken,
  }) async {
    await _databaseSource.deleteRefreshToken(token: refreshToken);
  }
}

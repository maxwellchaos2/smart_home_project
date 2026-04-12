import 'package:refresh_token/src/domain/domain.dart';

abstract interface class IRefreshTokenRepository {
  Future<bool> createTableIfNotExists();

  Future<RefreshTokenEntity> create({
    required RefreshTokenInputEntity input,
  });

  Future<RefreshTokenEntity> fetchByToken({
    required String refreshToken,
  });

  Future<void> delete({
    required String refreshToken,
  });
}

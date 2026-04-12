import 'package:yandex_auth/src/domain/domain.dart';

abstract interface class IYandexAuthRepository {
  Future<bool> createTableIfNotExists();

  Future<YandexAuthTokenEntity> codeToToken({
    required String code,
  });

  Future<YandexAuthTokenEntity> saveToken({
    required YandexAuthTokenEntity input,
  });

  Future<YandexAuthTokenEntity?> fetchToken({
    required int projectId,
  });

  Future<YandexAuthTokenEntity> refreshToken({
    required YandexAuthTokenEntity input,
  });

  Future<void> revokeToken({
    required int projectId,
  });
}

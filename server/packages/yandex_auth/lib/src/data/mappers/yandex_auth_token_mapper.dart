import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class YandexAuthTokenMapper {
  static YandexAuthTokenEntity toEntity({required YandexAuthTokenModel from}) {
    return YandexAuthTokenEntity(
      accessToken: from.accessToken,
      refreshToken: from.refreshToken,
      expiresAt: from.expiresAt,
      projectId: from.projectId,
    );
  }

  static YandexAuthTokenModel toModel({required YandexAuthTokenEntity from}) {
    return YandexAuthTokenModel(
      accessToken: from.accessToken,
      refreshToken: from.refreshToken,
      expiresAt: from.expiresAt,
      projectId: from.projectId,
    );
  }
}

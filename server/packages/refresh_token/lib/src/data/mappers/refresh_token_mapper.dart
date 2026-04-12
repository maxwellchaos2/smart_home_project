import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class RefreshTokenMapper {
  static RefreshTokenEntity toEntity({required RefreshTokenModel from}) {
    return RefreshTokenEntity(
      id: from.id,
      refreshToken: from.token,
      userId: from.userId,
      expiresAt: from.expiresAt,
      createdAt: from.createdAt,
    );
  }
}

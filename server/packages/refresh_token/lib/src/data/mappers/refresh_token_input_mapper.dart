import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class RefreshTokenInputMapper {
  static RefreshTokenInputModel toModel(
      {required RefreshTokenInputEntity from,
      required String token,
      required DateTime expiresAt}) {
    return RefreshTokenInputModel(
      token: token,
      userId: from.userId,
      expiresAt: expiresAt,
    );
  }
}

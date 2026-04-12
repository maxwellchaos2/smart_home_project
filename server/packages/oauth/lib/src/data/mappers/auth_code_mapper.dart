import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class AuthCodeMapper {
  static AuthCodeEntity toEntity({required AuthCodeModel from}) {
    return AuthCodeEntity(
      code: from.code,
      clientId: from.clientId,
      userId: from.userId,
      expiresAt: from.expiresAt,
    );
  }

  static AuthCodeModel toModel({required AuthCodeEntity from}) {
    return AuthCodeModel(
      code: from.code,
      clientId: from.clientId,
      userId: from.userId,
      expiresAt: from.expiresAt,
    );
  }
}

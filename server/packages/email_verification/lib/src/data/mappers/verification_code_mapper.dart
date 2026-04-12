import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class VerificationCodeMapper {
  static VerificationCodeEntity toEntity(
      {required VerificationCodeModel from}) {
    return VerificationCodeEntity(
      id: from.id,
      email: from.email,
      code: from.code,
      createdAt: from.createdAt,
      expiresAt: from.expiresAt,
      verifiedAt: from.verifiedAt,
    );
  }
}

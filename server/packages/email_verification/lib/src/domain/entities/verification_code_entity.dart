import 'package:common/common.dart';

part 'verification_code_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class VerificationCodeEntity with _$VerificationCodeEntity {
  const VerificationCodeEntity._();

  const factory VerificationCodeEntity({
    required int id,
    required String email,
    required String code,
    required DateTime createdAt,
    required DateTime expiresAt,
    required DateTime? verifiedAt,
  }) = _VerificationCodeEntity;
}

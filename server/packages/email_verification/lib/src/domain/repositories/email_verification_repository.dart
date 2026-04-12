import 'package:email_verification/src/domain/domain.dart';

abstract interface class IEmailVerificationRepository {
  Future<void> createTableIfNotExists();

  Future<VerificationCodeEntity?> getCode({required String email});

  Future<VerificationCodeEntity> createCode({required String email});
  Future<VerificationCodeEntity?> getValidCode({
    required String email,
    required String code,
  });
  Future<void> markCodeAsVerified({required int id});

  Future<void> deleteCodes({required String email});
  Future<void> deleteExpiredCodes();
}

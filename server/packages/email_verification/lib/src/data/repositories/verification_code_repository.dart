import 'package:email_verification/src/data/data.dart';
import 'package:email_verification/src/domain/domain.dart';

final class VerificationCodeRepositoryImpl
    implements IEmailVerificationRepository {
  const VerificationCodeRepositoryImpl(
      {required IVerificationCodeLocalDatasource localDatasource})
      : _localDatasource = localDatasource;

  final IVerificationCodeLocalDatasource _localDatasource;

  @override
  Future<void> createTableIfNotExists() async {
    await _localDatasource.createTableIfNotExists();
  }

  @override
  Future<VerificationCodeEntity?> getCode({required String email}) async {
    return await _localDatasource.getCode(email: email);
  }

  @override
  Future<VerificationCodeEntity> createCode({required String email}) async {
    return await _localDatasource.createCode(email: email);
  }

  @override
  Future<VerificationCodeEntity?> getValidCode({
    required String email,
    required String code,
  }) async {
    return await _localDatasource.getValidCode(email: email, code: code);
  }

  @override
  Future<void> markCodeAsVerified({required int id}) async {
    await _localDatasource.markCodeAsVerified(id: id);
  }

  @override
  Future<void> deleteCodes({required String email}) async {
    await _localDatasource.deleteCodes(email: email);
  }

  @override
  Future<void> deleteExpiredCodes() async {
    await _localDatasource.deleteExpiredCodes();
  }
}

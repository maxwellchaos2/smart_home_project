import 'package:email_verification/src/data/data.dart';
import 'package:email_verification/src/domain/domain.dart';

abstract interface class IVerificationCodeLocalDatasource {
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

final class VerificationCodeLocalDatasourceImpl
    implements IVerificationCodeLocalDatasource {
  const VerificationCodeLocalDatasourceImpl(
      {required IVerificationCodeDatabaseClient databaseClient})
      : _databaseClient = databaseClient;

  final IVerificationCodeDatabaseClient _databaseClient;

  @override
  Future<void> createTableIfNotExists() async {
    final created = await _databaseClient.tableExists();
    if (created) return;
    await _databaseClient.createTable();
  }

  @override
  Future<VerificationCodeEntity?> getCode({required String email}) async {
    final codeModel = await _databaseClient.getCode(email: email);
    if (codeModel == null) {
      return null;
    }
    return VerificationCodeMapper.toEntity(from: codeModel);
  }

  @override
  Future<VerificationCodeEntity> createCode({required String email}) async {
    final codeModel = await _databaseClient.createCode(email: email);
    return VerificationCodeMapper.toEntity(from: codeModel);
  }

  @override
  Future<VerificationCodeEntity?> getValidCode({
    required String email,
    required String code,
  }) async {
    final codeModel = await _databaseClient.getValidCode(
      email: email,
      code: code,
    );
    if (codeModel == null) {
      return null;
    }
    return VerificationCodeMapper.toEntity(from: codeModel);
  }

  @override
  Future<void> markCodeAsVerified({required int id}) async {
    await _databaseClient.markCodeAsVerified(id: id);
  }

  @override
  Future<void> deleteCodes({required String email}) async {
    await _databaseClient.deleteCodes(email: email);
  }

  @override
  Future<void> deleteExpiredCodes() async {
    await _databaseClient.deleteExpiredCodes();
  }
}

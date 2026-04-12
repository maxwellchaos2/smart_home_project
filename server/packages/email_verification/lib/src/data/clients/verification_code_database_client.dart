import 'dart:math';

import 'package:database/database.dart';
import 'package:email_verification/src/data/data.dart';

abstract interface class IVerificationCodeDatabaseClient {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<VerificationCodeModel?> getCode({required String email});

  Future<VerificationCodeModel> createCode({required String email});
  Future<VerificationCodeModel?> getValidCode({
    required String email,
    required String code,
  });
  Future<void> markCodeAsVerified({required int id});

  Future<void> deleteCodes({required String email});
  Future<void> deleteExpiredCodes();
}

final class VerificationCodeDatabaseClientImpl
    implements IVerificationCodeDatabaseClient {
  const VerificationCodeDatabaseClientImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;
  final String tableName = 'email_verification_codes';

  @override
  Future<bool> tableExists() async {
    return await _database.repo.tableExists(tableName: tableName);
  }

  @override
  Future<bool> createTable() async {
    return await _database.repo.createTable(
      tableName: tableName,
      columns: [
        'id SERIAL PRIMARY KEY',
        'email VARCHAR(255) NOT NULL',
        'code VARCHAR(6) NOT NULL',
        'created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP',
        'expires_at TIMESTAMP NOT NULL',
        'verified_at TIMESTAMP',
      ],
    );
  }

  @override
  Future<VerificationCodeModel?> getCode({required String email}) async {
    final results = await _database.repo.execute(
      '''
      SELECT *
      FROM $tableName
      WHERE email = @email
      ORDER BY created_at DESC
      LIMIT 1
      ''',
      parameters: {
        'email': email,
      },
    );

    if (results.isEmpty) {
      return null;
    }

    return VerificationCodeModel.fromJson(results.first);
  }

  Future<VerificationCodeModel> createCode({required String email}) async {
    final code = _generateCode();
    final now = DateTime.now();
    final expiresAt = now.add(const Duration(minutes: 10));

    final inputMap = {
      'email': email,
      'code': code,
      'created_at': now.toIso8601String(),
      'expires_at': expiresAt.toIso8601String(),
      'verified_at': null,
    };
    final codeModel =
        await _database.repo.insert(tableName: tableName, input: inputMap);
    return VerificationCodeModel.fromJson(codeModel);
  }

  @override
  Future<VerificationCodeModel?> getValidCode({
    required String email,
    required String code,
  }) async {
    final results = await _database.repo.execute(
      '''
      SELECT *
      FROM $tableName
      WHERE email = @email
        AND code = @code
        AND expires_at > CURRENT_TIMESTAMP
        AND verified_at IS NULL
      ORDER BY created_at DESC
      LIMIT 1
      ''',
      parameters: {
        'email': email,
        'code': code,
      },
    );

    if (results.isEmpty) {
      return null;
    }

    return VerificationCodeModel.fromJson(results.first);
  }

  @override
  Future<void> markCodeAsVerified({required int id}) async {
    await _database.repo.execute(
      '''
      UPDATE $tableName
      SET verified_at = CURRENT_TIMESTAMP
      WHERE id = @id
      ''',
      parameters: {
        'id': id,
      },
    );
  }

  @override
  Future<void> deleteCodes({required String email}) async {
    await _database.repo.execute(
      '''
      DELETE FROM $tableName
      WHERE email = @email
      ''',
      parameters: {
        'email': email,
      },
    );
  }

  @override
  Future<void> deleteExpiredCodes() async {
    await _database.repo.execute(
      '''
      DELETE FROM $tableName    
      WHERE expires_at <= CURRENT_TIMESTAMP
      ''',
    );
  }
}

// Генерация случайного 6-значного кода
String _generateCode() {
  final random = Random();
  final code = List.generate(6, (_) => random.nextInt(10)).join();
  return code;
}

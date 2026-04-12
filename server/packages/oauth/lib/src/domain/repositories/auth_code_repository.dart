import 'package:oauth/src/domain/entities/auth_code_entity.dart';

abstract interface class IAuthCodeRepository {
  Future<bool> createTableIfNotExists();

  Future<AuthCodeEntity> create({
    required AuthCodeEntity input,
  });

  Future<AuthCodeEntity?> findByCode(String code);
}

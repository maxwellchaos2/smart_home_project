import 'package:users/src/domain/domain.dart';

abstract interface class IUsersRepository {
  Future<bool> createTableIfNotExists();

  Future<UserEntity> fetch({
    required int id,
  });

  Future<UserEntity?> fetchByUsername({
    required String username,
  });

  Future<UserEntity> create({
    required UserInputEntity input,
  });

  Future<UserEntity?> authenticateUser({
    required String username,
    required String password,
  });
}

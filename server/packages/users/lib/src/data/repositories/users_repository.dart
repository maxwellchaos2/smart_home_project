import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:users/src/data/data.dart';
import 'package:users/src/domain/domain.dart';

final class UsersRepositoryImpl implements IUsersRepository {
  const UsersRepositoryImpl({
    required IUsersDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IUsersDatabaseDatasource _databaseSource;

  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<UserEntity> fetch({
    required int id,
  }) async {
    return await _databaseSource.fetch(id: id);
  }

  @override
  Future<UserEntity?> fetchByUsername({
    required String username,
  }) async {
    return await _databaseSource.fetchByUsername(username: username);
  }

  @override
  Future<UserEntity> create({
    required UserInputEntity input,
  }) async {
    return await _databaseSource.createUser(input: input);
  }

  @override
  Future<UserEntity?> authenticateUser({
    required String username,
    required String password,
  }) async {
    final user = await _databaseSource.fetchByUsername(username: username);
    if (user == null) return null;

    final passwordHash = sha256.convert(utf8.encode(password)).toString();

    if (user.passwordHash == passwordHash) {
      return user;
    } else {
      return null;
    }
  }
}

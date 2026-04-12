import 'package:users/src/data/data.dart';
import 'package:users/src/domain/domain.dart';

abstract interface class IUsersDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<UserEntity>> fetchAll();
  Future<UserEntity> fetch({required int id});
  Future<UserEntity?> fetchByUsername({required String username});
  Future<UserEntity> createUser({required UserInputEntity input});
}

final class UsersDatabaseDatasourceImpl implements IUsersDatabaseDatasource {
  const UsersDatabaseDatasourceImpl({required IUsersDatabaseClient client})
      : _client = client;

  final IUsersDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<UserEntity>> fetchAll() async {
    final users = await _client.fetchAll();
    return users.map((user) => UserMapper.toEntity(from: user)).toList();
  }

  @override
  Future<UserEntity?> fetchByUsername({required String username}) async {
    final user = await _client.fetchByUsername(username: username);
    return user != null ? UserMapper.toEntity(from: user) : null;
  }

  @override
  Future<UserEntity> fetch({required int id}) async {
    final user = await _client.fetch(id: id);
    return UserMapper.toEntity(from: user);
  }

  @override
  Future<UserEntity> createUser({required UserInputEntity input}) async {
    final user =
        await _client.createUser(input: UserInputMapper.toModel(from: input));
    return UserMapper.toEntity(from: user);
  }
}

import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:users/src/data/data.dart';
import 'package:users/src/domain/domain.dart';

abstract interface class IUsersRemoteDatasource {
  Future<UserEntity> fetch();
}

final class UsersRemoteDatasourceImpl implements IUsersRemoteDatasource {
  const UsersRemoteDatasourceImpl({required UsersApiClient client})
      : _client = client;

  final UsersApiClient _client;

  @override
  Future<UserEntity> fetch() async {
    try {
      final response = await _client.fetch();
      return UserMapper.toEntity(from: response);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}

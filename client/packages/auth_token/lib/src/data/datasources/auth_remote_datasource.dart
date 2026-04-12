import 'package:common/common.dart';
import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../data.dart';

abstract interface class IAuthTokenRemoteDatasource {
  Future<AuthTokenEntity> signIn({
    required SignInInputEntity data,
  });

  Future<AuthTokenEntity> signInDevice({
    required SignInDeviceInputEntity data,
  });

  Future<AuthTokenEntity> refreshToken({
    required RefreshTokenInputEntity data,
  });
}

final class AuthTokenRemoteDatasourceImpl
    implements IAuthTokenRemoteDatasource {
  const AuthTokenRemoteDatasourceImpl({required AuthTokenApiClient client})
      : _client = client;

  final AuthTokenApiClient _client;

  @override
  Future<AuthTokenEntity> refreshToken(
      {required RefreshTokenInputEntity data}) async {
    try {
      final token = await _client.refresh(
        data: RefreshTokenInputMapper.toModel(from: data),
      );
      return AuthTokenMapper.toEntity(from: token);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<AuthTokenEntity> signIn({required SignInInputEntity data}) async {
    try {
      final token = await _client.signIn(
        data: SignInInputMapper.toModel(from: data),
      );
      return AuthTokenMapper.toEntity(from: token);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<AuthTokenEntity> signInDevice(
      {required SignInDeviceInputEntity data}) async {
    try {
      final token = await _client.signInDevice(
        data: SignInDeviceInputMapper.toModel(from: data),
      );
      return AuthTokenMapper.toEntity(from: token);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}

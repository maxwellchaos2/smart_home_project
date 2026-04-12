import 'dart:async';

import 'package:auth_token/src/domain/domain.dart';

import '../data.dart';

class AuthTokenRepositoryImpl implements IAuthTokenRepository {
  AuthTokenRepositoryImpl({
    required IAuthTokenRemoteDatasource remoteSource,
    required IAuthTokenLocalDatasource tokenLocalSource,
  })  : _remoteSource = remoteSource,
        _tokenLocalSource = tokenLocalSource;

  final IAuthTokenRemoteDatasource _remoteSource;
  final IAuthTokenLocalDatasource _tokenLocalSource;

  final StreamController<AuthTokenEntity?> _tokenChangedStreamController =
      StreamController.broadcast();
  @override
  Stream<AuthTokenEntity?> get tokenChanged =>
      _tokenChangedStreamController.stream;

  @override
  Future<AuthTokenEntity?> fetchToken() {
    return _tokenLocalSource.fetch();
  }

  @override
  Future<void> revokeToken() async {
    await _tokenLocalSource.remove();
    _tokenChangedStreamController.add(null);
  }

  @override
  Future<AuthTokenEntity> refreshToken(
      {required RefreshTokenInputEntity data}) async {
    final token = await _remoteSource.refreshToken(data: data);
    await _tokenLocalSource.save(token: token);
    _tokenChangedStreamController.add(token);
    return token;
  }

  @override
  Future<AuthTokenEntity> signIn({required SignInInputEntity data}) async {
    final token = await _remoteSource.signIn(data: data);
    await _tokenLocalSource.save(token: token);
    _tokenChangedStreamController.add(token);
    return token;
  }

  @override
  Future<AuthTokenEntity> signInDevice(
      {required SignInDeviceInputEntity data}) async {
    final token = await _remoteSource.signInDevice(data: data);
    return token;
  }

  @override
  Future<AuthTokenEntity?> updateToken({AuthTokenEntity? token}) async {
    if (token == null) {
      await _tokenLocalSource.remove();
      _tokenChangedStreamController.add(null);
      return null;
    }
    await _tokenLocalSource.save(token: token);
    _tokenChangedStreamController.add(token);
    return token;
  }

  @override
  void dispose() {
    _tokenChangedStreamController.close();
  }
}

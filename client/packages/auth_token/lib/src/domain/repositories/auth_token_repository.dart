import 'package:auth_token/src/domain/domain.dart';

abstract interface class IAuthTokenRepository {
  Future<AuthTokenEntity?> fetchToken();

  Future<void> revokeToken();

  Future<AuthTokenEntity> refreshToken({required RefreshTokenInputEntity data});

  Future<AuthTokenEntity> signIn({required SignInInputEntity data});

  Future<AuthTokenEntity> signInDevice({required SignInDeviceInputEntity data});

  Stream<AuthTokenEntity?> get tokenChanged;

  void dispose();

  Future<AuthTokenEntity?> updateToken({AuthTokenEntity? token});
}

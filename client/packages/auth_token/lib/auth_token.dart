library;

import 'package:auth_token/src/data/data.dart';
import 'package:auth_token/src/di/di.dart';
import 'package:common/common.dart';
import 'package:dio/dio.dart';

export 'src/application/application.dart'
    show
        AuthTokenScope,
        SignInScope,
        AuthTokenBlocListener,
        SignInBlocListener,
        SignInDeviceScope,
        SignInDeviceBlocListener;
export 'src/data/data.dart' show AuthTokenMapper, AuthTokenModel;
export 'src/domain/domain.dart'
    show
        IAuthTokenRepository,
        AuthTokenEntity,
        SignInInputEntity,
        ISignInController,
        SignInBloc,
        SignInState,
        SignInDeviceInputEntity;

abstract final class AuthTokenModule {
  static Future<void> init({required GetIt locator}) async {
    await AuthTokenDI.init(locator: locator);
    final dio = locator.get<Dio>();
    dio.interceptors.add(AuthTokenInterceptor(
      dio,
      () => locator.get(),
    ));
  }
}

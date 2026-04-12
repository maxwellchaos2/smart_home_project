import 'package:auth_token/src/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_token_api_client.g.dart';

@RestApi()
abstract class AuthTokenApiClient {
  factory AuthTokenApiClient(Dio dio) = _AuthTokenApiClient;

  @POST('/tokens/login')
  Future<AuthTokenModel> signIn({
    @Body() required SignInInputModel data,
  });

  @POST('/tokens/refresh')
  Future<AuthTokenModel> refresh({
    @Body() required RefreshTokenInputModel data,
  });

  @POST('/tokens/login-device')
  Future<AuthTokenModel> signInDevice({
    @Body() required SignInDeviceInputModel data,
  });
}

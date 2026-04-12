import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yandex_auth/src/data/data.dart';

part 'yandex_auth_api_client.g.dart';

@RestApi(baseUrl: 'https://oauth.yandex.ru/')
abstract class YandexAuthApiClient {
  factory YandexAuthApiClient(Dio dio) = _YandexAuthApiClient;

  @POST('/token')
  Future<YandexAuthTokenModel> fetchToken({
    @Field('code') required String code,
    @Header('Authorization') required String clientAuth,
    @Field('grant_type') String grantType = 'authorization_code',
  });

  @POST('/token')
  Future<YandexAuthTokenModel> refreshToken({
    @Field('refresh_token') required String refreshToken,
    @Header('Authorization') required String clientAuth,
    @Field('grant_type') String grantType = 'refresh_token',
  });

  @POST('/revoke_token')
  Future<void> revokeToken({
    @Field('access_token') required String accessToken,
    @Header('Authorization') required String clientAuth,
  });
}

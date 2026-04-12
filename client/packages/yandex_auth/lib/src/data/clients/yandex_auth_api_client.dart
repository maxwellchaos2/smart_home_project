import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'yandex_auth_api_client.g.dart';

@RestApi()
abstract class YandexAuthApiClient {
  factory YandexAuthApiClient(Dio dio) = _YandexAuthApiClient;

  @POST('/yandex-auth/token')
  Future<void> signIn({
    @Field('code') required String code,
  });

  @POST('/projects/{projectId}/yandex-devices/update')
  Future<void> updateYandexDevices({
    @Path('projectId') required int projectId,
  });

  @POST('/yandex-auth/revoke')
  Future<void> signOut();
}

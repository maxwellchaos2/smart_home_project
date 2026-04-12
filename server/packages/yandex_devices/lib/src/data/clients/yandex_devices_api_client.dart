import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yandex_devices/src/data/data.dart';

part 'yandex_devices_api_client.g.dart';

@RestApi(baseUrl: 'https://api.iot.yandex.net/')
abstract class YandexDevicesApiClient {
  factory YandexDevicesApiClient(Dio dio) = _YandexDevicesApiClient;

  @GET('/v1.0/user/info')
  Future<YandexUserInfoResponseModel> fetchUserInfo({
    @Header('Authorization') required String authToken,
  });

  @POST('/v1.0/devices/actions')
  Future<Map<String, dynamic>> updateDeviceCapabilitiesState({
    @Header('Authorization') required String authToken,
    @Body() required Map<String, dynamic> data,
  });
}

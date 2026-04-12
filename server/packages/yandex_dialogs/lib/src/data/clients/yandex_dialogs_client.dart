import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'yandex_dialogs_client.g.dart';

@RestApi()
abstract class YandexDialogsClient {
  factory YandexDialogsClient(Dio dio) = _YandexDialogsClient;

  @POST('/callback/state')
  Future<void> devicesStateChanged({
    @Field('ts') required double timestamp,
    @Field('payload') required Map<String, dynamic> payload,
  });
}

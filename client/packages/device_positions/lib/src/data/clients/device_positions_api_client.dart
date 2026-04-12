import 'package:device_positions/src/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'device_positions_api_client.g.dart';

@RestApi()
abstract class DevicePositionsApiClient {
  factory DevicePositionsApiClient(Dio dio) = _DevicePositionsApiClient;

  @GET('/device-positions')
  Future<List<DevicePositionModel>> fetchAll();
}

import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'devices_api_client.g.dart';

@RestApi()
abstract class DevicesApiClient {
  factory DevicesApiClient(Dio dio) = _DevicesApiClient;

  @GET('/projects/{projectId}/devices')
  Future<List<DeviceResponseModel>> fetchAll({
    @Path('projectId') required int projectId,
  });

  @POST('/projects/{projectId}/devices/create')
  Future<DeviceResponseModel> createDevice({
    @Path('projectId') required int projectId,
    @Body() required DeviceInputModel input,
  });

  @PUT('/projects/{projectId}/devices/{id}/update')
  Future<DeviceResponseModel> updateDevice({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
    @Body() required DeviceInputModel input,
  });

  @DELETE('/projects/{projectId}/devices/{id}/delete')
  Future<void> deleteDevice({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
  });

  @POST('/projects/{projectId}/yandex-devices/update')
  Future<void> updateYandexDevices();
}

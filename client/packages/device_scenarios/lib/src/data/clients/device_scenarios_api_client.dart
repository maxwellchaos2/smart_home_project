import 'package:device_scenarios/src/data/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'device_scenarios_api_client.g.dart';

@RestApi()
abstract class DeviceScenariosApiClient {
  factory DeviceScenariosApiClient(Dio dio) = _DeviceScenariosApiClient;

  @GET('/projects/{projectId}/device_scenarios')
  Future<List<DeviceScenarioModel>> fetchAll({
    @Path('projectId') required int projectId,
  });

  @POST('/projects/{projectId}/device_scenarios/create')
  Future<DeviceScenarioModel> create({
    @Path('projectId') required int projectId,
    @Body() required DeviceScenarioInputModel input,
  });

  @PUT('/projects/{projectId}/device_scenarios/{id}/update')
  Future<DeviceScenarioModel> update({
    @Path('id') required int id,
    @Path('projectId') required int projectId,
    @Body() required DeviceScenarioInputModel input,
  });

  @DELETE('/projects/{projectId}/device_scenarios/{id}/delete')
  Future<void> delete({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
  });

  @POST('/projects/{projectId}/device_scenarios/{id}/run')
  Future<void> run({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
  });
}

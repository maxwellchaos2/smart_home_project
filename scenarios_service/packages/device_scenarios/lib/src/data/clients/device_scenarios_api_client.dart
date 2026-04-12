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

  @GET('/projects/{projectId}/device_scenarios/{id}')
  Future<DeviceScenarioModel> fetch({
    @Path('id') required int id,
    @Path('projectId') required int projectId,
  });
}

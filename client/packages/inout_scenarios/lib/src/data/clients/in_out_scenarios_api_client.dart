import 'package:dio/dio.dart';
import 'package:inout_scenarios/src/data/data.dart';
import 'package:retrofit/retrofit.dart';

part 'in_out_scenarios_api_client.g.dart';

@RestApi()
abstract class InOutScenariosApiClient {
  factory InOutScenariosApiClient(Dio dio) = _InOutScenariosApiClient;

  @GET('/projects/{projectId}/inout_scenarios')
  Future<List<InOutScenarioModel>> fetchAll({
    @Path('projectId') required int projectId,
  });

  @POST('/projects/{projectId}/inout_scenarios/create')
  Future<InOutScenarioModel> create({
    @Path('projectId') required int projectId,
    @Body() required InOutScenarioInputModel input,
  });

  @PUT('/projects/{projectId}/inout_scenarios/{id}/update')
  Future<InOutScenarioModel> update({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
    @Body() required InOutScenarioInputModel input,
  });

  @DELETE('/projects/{projectId}/inout_scenarios/{id}/delete')
  Future<void> delete({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
  });
}

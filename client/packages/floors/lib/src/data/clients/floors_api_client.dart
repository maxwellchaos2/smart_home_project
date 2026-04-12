import 'package:dio/dio.dart';
import 'package:floors/src/data/data.dart';
import 'package:retrofit/retrofit.dart';

part 'floors_api_client.g.dart';

@RestApi()
abstract class FloorsApiClient {
  factory FloorsApiClient(Dio dio) = _FloorsApiClient;

  @GET('/projects/{projectId}/floors')
  Future<List<FloorModel>> fetchAll({
    @Path('projectId') required int projectId,
  });

  @POST('/projects/{projectId}/floors/create')
  Future<FloorModel> create({
    @Path('projectId') required int projectId,
    @Body() required FloorInputModel input,
  });
}

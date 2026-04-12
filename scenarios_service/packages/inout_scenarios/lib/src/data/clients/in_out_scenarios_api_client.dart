import 'package:dio/dio.dart';
import 'package:inout_scenarios/src/data/data.dart';
import 'package:retrofit/retrofit.dart';

part 'in_out_scenarios_api_client.g.dart';

@RestApi()
abstract class InOutScenariosApiClient {
  factory InOutScenariosApiClient(Dio dio) = _InOutScenariosApiClient;

  @GET('/inout_scenarios')
  Future<List<InOutScenarioModel>> fetchAll();
}

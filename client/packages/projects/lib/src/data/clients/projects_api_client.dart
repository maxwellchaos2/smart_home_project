import 'package:dio/dio.dart';
import 'package:projects/src/data/data.dart';
import 'package:retrofit/retrofit.dart';

part 'projects_api_client.g.dart';

@RestApi()
abstract class ProjectsApiClient {
  factory ProjectsApiClient(Dio dio) = _ProjectsApiClient;

  @GET('/projects')
  Future<List<ProjectModel>> fetch();
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:users/src/data/data.dart';

part 'users_api_client.g.dart';

@RestApi()
abstract class UsersApiClient {
  factory UsersApiClient(Dio dio) = _UsersApiClient;

  @GET('/users/me')
  Future<UserModel> fetch();
}

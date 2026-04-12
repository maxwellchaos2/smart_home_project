import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rooms/rooms.dart';

part 'rooms_api_client.g.dart';

@RestApi()
abstract class RoomsApiClient {
  factory RoomsApiClient(Dio dio) = _RoomsApiClient;

  @GET('/projects/{projectId}/rooms')
  Future<List<RoomModel>> fetchAll({
    @Path('projectId') required int projectId,
  });

  @POST('/projects/{projectId}/rooms/create')
  Future<RoomModel> createRoom({
    @Path('projectId') required int projectId,
    @Body() required RoomInputModel input,
  });

  @PUT('/projects/{projectId}/rooms/{id}/update')
  Future<RoomModel> updateRoom({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
    @Body() required RoomInputModel input,
  });

  @DELETE('/projects/{projectId}/rooms/{id}/delete')
  Future<void> deleteRoom({
    @Path('projectId') required int projectId,
    @Path('id') required int id,
  });
}

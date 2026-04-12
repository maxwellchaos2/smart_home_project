import 'dart:convert';

import 'package:common/common.dart';
import 'package:events/events.dart';
import 'package:media/media.dart';
import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<Response> updateRoomHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;

  final currentUser = request.context['currentUser'] as UserEntity;

  final repository = locator.get<IRoomsRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();

  final room = await repository.fetch(id: int.parse(id));

  if (!(currentUser.isAdmin || int.parse(projectId) == room.projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to update this room'}),
      headers: {'content-type': 'application/json'},
    );
  }

  late final Map<String, dynamic> data;
  late final String? planFilePath;
  try {
    final (data: Map<String, dynamic> _data, files: files) =
        await MultipartUtils.filesAndDataFromMultipart(
      request,
      extension: 'svg',
      folder: 'room-plans',
      fileFieldNames: ['planFile'],
    );
    data = _data;
    planFilePath = files.firstOrNull;
  } catch (e) {
    data = jsonDecode(await request.readAsString());
    planFilePath = data['plan_media_path'] as String?;
  }
  final model = RoomInputRequestModel.fromJson(data);

  final room1 = await repository.update(
    id: int.parse(id),
    input: RoomInputRequestMapper.toEntity(
      from: model,
      planMediaPath: planFilePath,
    ),
  );

  // Отправка события о обновлении комнаты по вебсокету
  final event = await eventsRepository.create(
    input: EventInputEntity.roomUpdated(room: room1),
  );
  webSocketRepository.sendMessage(
    [EventResponseMapper.toModel(from: event).toJson()],
    topic: 'project-${room1.projectId}',
  );

  final jsonResult = RoomResponseMapper.toModel(from: room1).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

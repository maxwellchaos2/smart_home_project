import 'dart:convert';

import 'package:common/common.dart';
import 'package:events/events.dart';
import 'package:rooms/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<Response> deleteRoomHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;

  final currentUser = request.context['currentUser'] as UserEntity;

  final repository = locator.get<IRoomsRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();

  final room = await repository.fetch(id: int.parse(id));

  if (!(currentUser.isAdmin || int.parse(projectId) == room.projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to delete this room'}),
      headers: {'content-type': 'application/json'},
    );
  }

  await repository.delete(
    id: int.parse(id),
  );

  // Отправка события о удалении комнаты по вебсокету
  final event = await eventsRepository.create(
    input: EventInputEntity.roomDeleted(room: room),
  );
  webSocketRepository.sendMessage(
    [EventResponseMapper.toModel(from: event).toJson()],
    topic: 'project-${room.projectId}',
  );

  return Response.ok(
    jsonEncode({'message': 'Room deleted successfully'}),
    headers: {'content-type': 'application/json'},
  );
}

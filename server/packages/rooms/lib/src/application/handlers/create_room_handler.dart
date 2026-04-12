import 'dart:convert';

import 'package:common/common.dart';
import 'package:events/events.dart';
import 'package:media/media.dart';
import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<Response> createRoomHandler(Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IRoomsRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();

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

  final room = await repository.create(
    input: RoomInputRequestMapper.toEntity(
      from: model,
      planMediaPath: planFilePath,
    ),
  );

  // Отправка события о создании комнаты по вебсокету
  final event = await eventsRepository.create(
    input: EventInputEntity.roomCreated(room: room),
  );
  webSocketRepository.sendMessage(
    [EventResponseMapper.toModel(from: event).toJson()],
    topic: 'project-${room.projectId}',
  );

  final jsonResult = RoomResponseMapper.toModel(from: room).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

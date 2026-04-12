import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:events/events.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<Response> deleteDeviceHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;
  final currentUser = request.context['currentUser'] as UserEntity;
  final repository = locator.get<IDevicesRepository>();

  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();

  final device = await repository.fetch(id: int.parse(id));

  if (!(currentUser.isAdmin || int.parse(projectId) == device.projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to delete this device'}),
      headers: {'content-type': 'application/json'},
    );
  }

  await repository.deleteDevice(id: int.parse(id));

  // Отправка события об удалении устройства по вебсокету
  final event = await eventsRepository.create(
    input: EventInputEntity.deviceDeleted(device: device),
  );
  webSocketRepository.sendMessage(
    [EventResponseMapper.toModel(from: event).toJson()],
    topic: 'project-${device.projectId}',
  );

  return Response.ok(
    jsonEncode({'message': 'Device deleted successfully'}),
    headers: {'content-type': 'application/json'},
  );
}

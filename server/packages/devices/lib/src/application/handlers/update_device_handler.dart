import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:events/events.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<Response> updateDeviceHandler(
    Request request, String projectId, String id) async {
  final data = jsonDecode(await request.readAsString());
  final locator = request.context['locator'] as GetIt;
  final currentUser = request.context['currentUser'] as UserEntity;
  final repository = locator.get<IDevicesRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();

  final _device = await repository.fetch(id: int.parse(id));

  if (!(currentUser.isAdmin || int.parse(projectId) == _device.projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to update this device'}),
      headers: {'content-type': 'application/json'},
    );
  }

  final model = DeviceInputRequestModel.fromJson(data);

  final device = await repository.updateDevice(
    deviceId: int.parse(id),
    input: DeviceInputRequestMapper.toEntity(
      from: model,
      projectId: int.parse(projectId),
    ),
  );

  // Отправка события об обновлении устройства по вебсокету
  final event = await eventsRepository.create(
    input: EventInputEntity.deviceUpdated(device: device),
  );
  webSocketRepository.sendMessage(
    [EventResponseMapper.toModel(from: event).toJson()],
    topic: 'project-${device.projectId}',
  );

  final jsonResult = DeviceResponseMapper.toModel(from: device).toJson();

  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

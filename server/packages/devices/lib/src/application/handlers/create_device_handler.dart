import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:events/events.dart';
import 'package:shelf/shelf.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<Response> createDeviceHandler(Request request, String projectId) async {
  final data = jsonDecode(await request.readAsString());
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDevicesRepository>();
  final webSocketRepository = locator.get<IWebSocketRepository>();
  final eventsRepository = locator.get<IEventsRepository>();

  final model = DeviceInputRequestModel.fromJson(data);
  final device = await repository.createDevice(
    input: DeviceInputRequestMapper.toEntity(
      from: model,
      projectId: int.parse(projectId),
    ),
  );

  // Отправка события о создании устройства по вебсокету
  final event = await eventsRepository.create(
    input: EventInputEntity.deviceCreated(device: device),
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

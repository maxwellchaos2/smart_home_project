import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> fetchDeviceHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;
  final currentUser = request.context['currentUser'] as UserEntity;

  final repository = locator.get<IDevicesRepository>();
  final device = await repository.fetch(id: int.parse(id));

  if (!(currentUser.isAdmin || int.parse(projectId) == device.projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to delete this device'}),
      headers: {'content-type': 'application/json'},
    );
  }

  final jsonResult = DeviceResponseMapper.toModel(from: device).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

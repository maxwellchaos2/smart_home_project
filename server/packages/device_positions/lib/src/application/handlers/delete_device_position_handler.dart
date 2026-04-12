import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_positions/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> deleteDevicePositionHandler(Request request, String id) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDevicePositionsRepository>();

  // Проверяем, является ли текущий пользователь администратором
  if (checkRequestIsAdmin(request) == false) {
    return Response.forbidden('Only admins can delete rooms');
  }

  await repository.delete(
    id: int.parse(id),
  );
  return Response.ok(
    jsonEncode({'message': 'Device deleted successfully'}),
    headers: {'content-type': 'application/json'},
  );
}

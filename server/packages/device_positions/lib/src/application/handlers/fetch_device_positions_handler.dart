import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_positions/src/application/mappers/device_position_response_mapper.dart';
import 'package:device_positions/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> fetchDevicePositionsHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDevicePositionsRepository>();

  final currentUser = request.context['currentUser'] as UserEntity;
  final rooms = await repository.fetchAll(
    userId: currentUser.isAdmin ? null : currentUser.id,
  );
  final jsonResult = rooms
      .map((device) =>
          DevicePositionResponseMapper.toModel(from: device).toJson())
      .toList();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

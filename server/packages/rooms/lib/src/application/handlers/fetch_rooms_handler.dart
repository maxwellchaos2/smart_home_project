import 'dart:convert';

import 'package:common/common.dart';
import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> fetchRoomsHandler(Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IRoomsRepository>();

  final rooms = await repository.fetchAll(
    projectId: int.parse(projectId),
  );
  final jsonResult = rooms
      .map((device) => RoomResponseMapper.toModel(from: device).toJson())
      .toList();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

import 'dart:convert';

import 'package:common/common.dart';
import 'package:floors/src/application/application.dart';
import 'package:floors/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> fetchFloorsHandler(Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IFloorsRepository>();

  final floors = await repository.fetchAll(
    projectId: int.parse(projectId),
  );
  final jsonResult = floors
      .map((floor) => FloorResponseMapper.toModel(from: floor).toJson())
      .toList();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

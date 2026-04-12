import 'dart:convert';

import 'package:common/common.dart';
import 'package:inout_scenario/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> deleteInOutScenarioHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IInOutScenarioRepository>();

  final scenario = await repository.fetch(id: int.parse(id));

  if (scenario.projectId != int.parse(projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to delete this scenario'}),
      headers: {'content-type': 'application/json'},
    );
  }
  await repository.delete(id: int.parse(id));
  return Response.ok(
    jsonEncode({'message': 'Scenario deleted successfully'}),
    headers: {'content-type': 'application/json'},
  );
}

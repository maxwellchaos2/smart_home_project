import 'dart:convert';

import 'package:common/common.dart';
import 'package:inout_scenario/src/application/application.dart';
import 'package:inout_scenario/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> updateInOutScenarioHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IInOutScenarioRepository>();

  final data = jsonDecode(await request.readAsString());
  final model = InOutScenarioInputRequestModel.fromJson(data);

  final scenarioForUpdate = await repository.fetch(id: int.parse(id));

  if (scenarioForUpdate.projectId != int.parse(projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to update this scenario'}),
      headers: {'content-type': 'application/json'},
    );
  }

  final scenario = await repository.update(
    id: int.parse(id),
    input: InOutScenarioInputRequestMapper.toEntity(
      from: model,
      projectId: int.parse(projectId),
    ),
  );
  final jsonResult =
      InOutScenarioResponseMapper.toModel(from: scenario).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

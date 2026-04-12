import 'dart:convert';

import 'package:common/common.dart';
import 'package:inout_scenario/src/application/application.dart';
import 'package:inout_scenario/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> createInOutScenarioHandler(
    Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IInOutScenarioRepository>();

  final data = jsonDecode(await request.readAsString());
  final model = InOutScenarioInputRequestModel.fromJson(data);

  final scenario = await repository.create(
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

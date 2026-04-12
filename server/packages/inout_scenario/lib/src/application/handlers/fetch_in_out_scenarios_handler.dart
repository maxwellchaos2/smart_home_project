import 'dart:convert';

import 'package:common/common.dart';
import 'package:inout_scenario/src/application/application.dart';
import 'package:inout_scenario/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> fetchInOutScenariosHandler(
    Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IInOutScenarioRepository>();

  final scenarios = await repository.fetchAll(
    projectId: int.parse(projectId),
  );

  final jsonResult = scenarios
      .map((scenario) =>
          InOutScenarioResponseMapper.toModel(from: scenario).toJson())
      .toList();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

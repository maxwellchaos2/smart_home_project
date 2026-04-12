import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_scenario/device_scenario.dart';
import 'package:device_scenario/src/application/application.dart';
import 'package:shelf/shelf.dart';

Future<Response> fetchDeviceScenarioHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDeviceScenarioRepository>();

  final scenario = await repository.fetchById(
    id: int.parse(id),
  );

  if (scenario == null) {
    return Response.notFound(
      jsonEncode({'error': 'Scenario not found'}),
      headers: {'content-type': 'application/json'},
    );
  }
  final jsonResult =
      DeviceScenarioResponseMapper.toModel(from: scenario).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

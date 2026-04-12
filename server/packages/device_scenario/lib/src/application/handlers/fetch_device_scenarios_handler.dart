import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_scenario/device_scenario.dart';
import 'package:device_scenario/src/application/application.dart';
import 'package:shelf/shelf.dart';

Future<Response> fetchDeviceScenariosHandler(
  Request request,
  String projectId,
) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDeviceScenarioRepository>();

  final scenarios = await repository.fetchAll(
    projectId: int.parse(projectId),
  );
  final jsonResult = scenarios
      .map((scenario) =>
          DeviceScenarioResponseMapper.toModel(from: scenario).toJson())
      .toList();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

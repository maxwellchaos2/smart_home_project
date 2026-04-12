import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_scenario/device_scenario.dart';
import 'package:device_scenario/src/application/application.dart';
import 'package:shelf/shelf.dart';

Future<Response> createDeviceScenarioHandler(
    Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDeviceScenarioRepository>();

  final data = jsonDecode(await request.readAsString());
  final model = DeviceScenarioInputRequestModel.fromJson(data);

  final scenario = await repository.create(
    input: DeviceScenarioInputRequestMapper.toEntity(
      from: model,
      projectId: int.parse(projectId),
    ),
  );
  final jsonResult =
      DeviceScenarioResponseMapper.toModel(from: scenario).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

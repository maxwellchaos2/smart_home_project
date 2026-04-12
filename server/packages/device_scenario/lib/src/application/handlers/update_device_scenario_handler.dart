import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_scenario/device_scenario.dart';
import 'package:device_scenario/src/application/application.dart';
import 'package:shelf/shelf.dart';

Future<Response> updateDeviceScenarioHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDeviceScenarioRepository>();

  final data = jsonDecode(await request.readAsString());
  final model = DeviceScenarioInputRequestModel.fromJson(data);

  // TODO: Проверить что сценарий принадлежит текущему пользователю
  final scenarioCheck = await repository.fetchById(id: int.parse(id));
  if (scenarioCheck == null ||
      scenarioCheck.projectId != int.parse(projectId)) {
    return Response.forbidden(
      jsonEncode({'message': 'You are not allowed to update this scenario'}),
      headers: {'content-type': 'application/json'},
    );
  }

  final scenario = await repository.update(
    id: int.parse(id),
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

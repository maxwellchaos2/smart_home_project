import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_scenario/device_scenario.dart';
import 'package:shelf/shelf.dart';
import 'package:web_socket_core/web_socket_core.dart';

Future<Response> runDeviceScenarioHandler(
    Request request, String projectId, String id) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDeviceScenarioRepository>();
  final _webSocketRepository = locator.get<IWebSocketRepository>();

  final scenario = await repository.fetchById(
    id: int.parse(id),
  );
  if (scenario == null || scenario.projectId != int.parse(projectId)) {
    return Response.notFound('Scenario not found');
  }
  _webSocketRepository.sendMessage(
    [
      {
        'type': 'needRunDeviceScenario',
        'scenarioId': int.parse(id),
      },
    ],
    topic: 'smartHub-project-${int.parse(projectId)}',
  );
  return Response.ok(
    jsonEncode({'status': 'ok'}),
    headers: {'content-type': 'application/json'},
  );
}

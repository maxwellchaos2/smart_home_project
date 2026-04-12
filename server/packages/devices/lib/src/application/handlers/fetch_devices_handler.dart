import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> fetchDevicesHandler(Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDevicesRepository>();
  final devices = await repository.fetchAll(
    projectId: int.parse(projectId),
  );
  final jsonResult = devices
      .map((device) => DeviceResponseMapper.toModel(from: device).toJson())
      .toList();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}

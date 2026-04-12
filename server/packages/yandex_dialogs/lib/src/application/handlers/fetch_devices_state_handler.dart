import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:yandex_dialogs/src/application/application.dart';

Future<Response> fetchDevicesStateHandler(Request request) async {
  final data = jsonDecode(await request.readAsString());

  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDevicesRepository>();
  final currentUser = request.context['currentUser'] as UserEntity;

  final requestModel = DevicesStateInputRequestModel.fromJson(data);

  final devices = await repository.fetchAll(
    projectId: currentUser.projectsId.first,
    ids: requestModel.devices
        .map((device) => int.parse(device.id))
        .toList(growable: false),
  );
  final jsonPayload = devices.map((device) {
    if (device.status == DeviceStatus.offline) {
      return {
        'id': device.id.toString(),
        'error_code': 'DEVICE_UNREACHABLE',
        'error_message': 'Device is offline',
      };
    }
    return YandexDeviceResponseMapper.toModel(from: device).toJson();
  }).toList();

  final jsonResponse = {
    'request_id': request.context['requestId'] ?? '-',
    'payload': {
      'user_id': currentUser.id.toString(),
      'devices': jsonPayload,
    },
  };
  return Response.ok(
    jsonEncode(jsonResponse),
    headers: {'content-type': 'application/json'},
  );
}

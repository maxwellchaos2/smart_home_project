import 'dart:convert';

import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:yandex_dialogs/src/application/application.dart';

Future<Response> fetchDevicesHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDevicesRepository>();
  final currentUser = request.context['currentUser'] as UserEntity;
  final devices = await repository.fetchAll(
    projectId: currentUser.projectsId.first,
  );
  final jsonPayload = devices
      .where(
        (device) => [DeviceProviderType.logoSiemens, DeviceProviderType.zigbee]
            .contains(device.providerType),
      )
      .map(
          (device) => YandexDeviceResponseMapper.toModel(from: device).toJson())
      .toList();

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

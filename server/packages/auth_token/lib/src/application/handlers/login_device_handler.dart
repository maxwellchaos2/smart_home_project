import 'dart:convert';

import 'package:auth_token/src/application/application.dart';
import 'package:common/common.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:devices/devices.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> loginDeviceHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final currentUser = request.context['currentUser'] as UserEntity;

  final data = LoginDeviceRequestMapper.toEntity(
    from: jsonDecode(await request.readAsString()),
  );

  final device =
      await locator.get<IDevicesRepository>().fetch(id: data.deviceId);
  if (!currentUser.projectsId.contains(device.projectId)) {
    return Response.forbidden('Invalid device');
  }

  final jwt = JWT(
    {
      'deviceId': device.id,
    },
    issuer: 'smart-home',
  );

  final token = jwt.sign(
    SecretKey(ENV.fromKey('JWT_SECRET_KEY')),
    expiresIn: null,
  );

  return Response.ok(
    jsonEncode({
      'token': token,
      'refreshToken': null,
    }),
    headers: {'content-type': 'application/json'},
  );
}

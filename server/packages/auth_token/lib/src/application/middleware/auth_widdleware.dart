import 'dart:io';

import 'package:common/common.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:devices/devices.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Middleware authMiddleware(String secretKey,
    {required List<String> publicPaths}) {
  return (Handler handler) {
    return (Request request) async {
      final locator = request.context['locator'] as GetIt;

      if (publicPaths.contains(request.url.path)) {
        return await handler(request);
      }
      late String token;
      print(request.url.path);
      if (request.url.path == 'ws') {
        token = request.url.queryParameters['authToken']!;
      } else {
        final authHeader = request.headers[HttpHeaders.authorizationHeader];

        if (authHeader == null || !authHeader.startsWith('Bearer ')) {
          return Response.forbidden('Missing or invalid Authorization header');
        }

        token = authHeader.substring(7);
      }

      Request updatedRequest;

      try {
        final jwt = JWT.verify(
          token,
          SecretKey(secretKey),
          checkExpiresIn: !request.url.path.contains('tokens/refresh'),
        );
        print('Verified JWT payload: ${jwt.payload}');
        if (jwt.payload['userId'] != null) {
          final userId = jwt.payload['userId'];

          final currentUser =
              await locator.get<IUsersRepository>().fetch(id: userId);

          updatedRequest = request.change(
            context: {'userId': userId, 'currentUser': currentUser},
          );
        } else if (jwt.payload['deviceId'] != null) {
          final deviceId = jwt.payload['deviceId'];

          final currentDevice =
              await locator.get<IDevicesRepository>().fetch(id: deviceId);

          updatedRequest = request.change(
            context: {'deviceId': deviceId, 'currentDevice': currentDevice},
          );
        } else {
          return Response.unauthorized('Invalid token payload');
        }
        return await handler(updatedRequest);
      } on JWTException catch (e) {
        print(e);
        return Response.unauthorized('Invalid or expired token');
      } on Exception catch (e) {
        if (e.toString().contains('Unauthorized')) {
          print(e);
          return Response.unauthorized('User not found');
        }
        return Response.internalServerError(body: e.toString());
      }
    };
  };
}

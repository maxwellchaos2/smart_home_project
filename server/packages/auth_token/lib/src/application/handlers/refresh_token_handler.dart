import 'dart:convert';

import 'package:common/common.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:refresh_token/refresh_token.dart';
import 'package:shelf/shelf.dart';

Future<Response> refreshTokenHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final refreshTokenRepository = locator.get<IRefreshTokenRepository>();

  late final dynamic data;
  print(request.headers);
  if (request.headers['user-agent']?.startsWith('yandex') ?? false) {
    // client_secret=yandex-Yis4C15sKe&grant_type=refresh_token&client_id=yandex-1&refresh_token=a5068917-e7b6-4ebd-94ce-01efc640d3d4
    final params = <String, String>{};
    for (var e in (await request.readAsString()).split('&')) {
      final parts = e.split('=');
      params[parts[0]] = parts[1];
    }
    print(params);
    data = {
      'refreshToken': params['refresh_token'],
    };
  } else {
    data = jsonDecode(await request.readAsString());
  }

  final oldRefreshToken = await refreshTokenRepository.fetchByToken(
    refreshToken: data['refreshToken'],
  );

  // if (request.context['userId'] != oldRefreshToken.userId) {
  //   return Response.forbidden('Invalid refresh token');
  // }

  await refreshTokenRepository.delete(
    refreshToken: data['refreshToken'],
  );

  final refreshToken = await refreshTokenRepository.create(
    input: RefreshTokenInputEntity(userId: oldRefreshToken.userId),
  );

  final jwt = JWT(
    {
      'userId': refreshToken.userId,
    },
    issuer: 'smart-home',
  );

  final expiredIn = const Duration(days: 7);
  final token = jwt.sign(
    SecretKey(ENV.fromKey('JWT_SECRET_KEY')),
    expiresIn: expiredIn,
  );

  return Response.ok(
    jsonEncode({
      'token': token,
      'refreshToken': refreshToken.refreshToken,
      //
      'access_token': token,
      'refresh_token': refreshToken.refreshToken,
      'expires_in': expiredIn.inSeconds,
      'token_type': 'Bearer',
    }),
    headers: {'content-type': 'application/json'},
  );
}

import 'dart:convert';

import 'package:common/common.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:oauth/src/application/handlers/login_handler.dart';
import 'package:oauth/src/domain/repositories/repositories.dart';
import 'package:refresh_token/refresh_token.dart';
import 'package:shelf/shelf.dart';

Future<Response> tokenHandler(Request request) async {
  final _yandexClientSecret = ENV.fromKey('YANDEX_CLIENT_SECRET');
  final locator = request.context['locator'] as GetIt;

  final refreshTokenRepository = locator.get<IRefreshTokenRepository>();

  final body = await request.readAsString();
  final formData = Uri.splitQueryString(body);

  final code = formData['code'];
  final clientId = formData['client_id'];
  final clientSecret = formData['client_secret'];
  final grantType = formData['grant_type'];

  if (grantType != 'authorization_code') {
    return Response(400, body: 'Invalid grant_type');
  }

  // Проверка client_id и client_secret
  if (clientId != yandexClientId || clientSecret != _yandexClientSecret) {
    print('Invalid client credentials');
    return Response(400, body: 'Invalid client credentials');
  }

  final authCode = await locator.get<IAuthCodeRepository>().findByCode(code!);
  if (authCode == null) {
    print('Invalid code');
    return Response(400, body: 'Invalid code');
  }

  final refreshToken = await refreshTokenRepository.create(
    input: RefreshTokenInputEntity(userId: authCode.userId),
  );

  final jwt = JWT(
    {
      'userId': authCode.userId,
    },
    issuer: 'smart-home',
  );

  final expiredIn = const Duration(days: 1);
  final token = jwt.sign(
    SecretKey(ENV.fromKey('JWT_SECRET_KEY')),
    expiresIn: expiredIn,
  );

  return Response.ok(
    jsonEncode({
      'access_token': token,
      'refresh_token': refreshToken.refreshToken,
      'expires_in': expiredIn.inSeconds,
      'token_type': 'Bearer',
    }),
    headers: {'content-type': 'application/json'},
  );
}

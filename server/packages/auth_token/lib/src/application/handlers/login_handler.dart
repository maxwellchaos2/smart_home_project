import 'dart:convert';

import 'package:auth_token/src/application/mappers/login_request_mapper.dart';
import 'package:common/common.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:refresh_token/refresh_token.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> loginHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final refreshTokenRepository = locator.get<IRefreshTokenRepository>();

  final data = LoginRequestMapper.toEntity(
    from: jsonDecode(await request.readAsString()),
  );

  final user = await locator
      .get<IUsersRepository>()
      .authenticateUser(username: data.username, password: data.password);

  if (user == null) {
    return Response.forbidden('Invalid credentials');
  }

  final refreshToken = await refreshTokenRepository.create(
    input: RefreshTokenInputEntity(userId: user.id),
  );

  final jwt = JWT(
    {
      'userId': user.id,
    },
    issuer: 'smart-home',
  );

  final token = jwt.sign(
    SecretKey(ENV.fromKey('JWT_SECRET_KEY')),
    expiresIn: const Duration(days: 7),
  );

  return Response.ok(
    jsonEncode({
      'token': token,
      'refreshToken': refreshToken.refreshToken,
    }),
    headers: {'content-type': 'application/json'},
  );
}

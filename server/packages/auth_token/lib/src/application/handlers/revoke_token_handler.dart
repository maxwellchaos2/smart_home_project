import 'dart:convert';

import 'package:common/common.dart';
import 'package:refresh_token/refresh_token.dart';
import 'package:shelf/shelf.dart';

Future<Response> revokeTokenHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final refreshTokenRepository = locator.get<IRefreshTokenRepository>();

  final data = jsonDecode(await request.readAsString());

  await refreshTokenRepository.delete(
    refreshToken: data['refreshToken'],
  );

  return Response.ok(
    'Token revoked',
    headers: {'content-type': 'application/json'},
  );
}

import 'dart:convert';

import 'package:common/common.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:email_verification/src/domain/domain.dart';
import 'package:shelf/shelf.dart';

Future<Response> confirmCodeHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;

  final data = jsonDecode(await request.readAsString());
  final email = data['email'] as String;
  final code = data['code'] as String;

  final repository = locator.get<IEmailVerificationRepository>();

  final validCode = await repository.getValidCode(email: email, code: code);
  if (validCode == null) {
    return Response(
      400,
      body: jsonEncode({'message': 'Invalid or expired code.'}),
      headers: {'content-type': 'application/json'},
    );
  }

  final jwt = JWT(
    {
      'type': 'email_verification',
      'email': email,
    },
    issuer: 'smart-home',
  );

  final tempToken = jwt.sign(
    SecretKey(ENV.fromKey('JWT_SECRET_KEY')),
    expiresIn: Duration(minutes: 10),
  );

  return Response.ok(
    jsonEncode({'tempToken': tempToken}),
    headers: {'content-type': 'application/json'},
  );
}

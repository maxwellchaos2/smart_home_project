import 'dart:convert';

import 'package:common/common.dart';
import 'package:email_verification/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:smtp/smtp.dart';

Future<Response> sendCodeHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;

  final email = jsonDecode(await request.readAsString())['email'] as String;
  final repository = locator.get<IEmailVerificationRepository>();
  final smtpRepository = locator.get<ISmtpRepository>();

  final code = await repository.getCode(email: email);
  if (code != null && DateTime.now().difference(code.createdAt).inMinutes < 1) {
    return Response(
      429,
      body: jsonEncode({
        'message':
            'Too many requests. Please wait before requesting a new code.'
      }),
      headers: {'content-type': 'application/json'},
    );
  }

  final newCode = await repository.createCode(email: email);

  await smtpRepository.sendMessage(
    message: SmtpMessageEntity(
      fromName: 'Проект Умный дом',
      recipients: [email],
      subject: 'Ваш код подтверждения',
      text: 'Ваш код подтверждения: ${newCode.code}',
    ),
  );

  return Response.ok(
    jsonEncode({
      'message': 'Verification code sent to $email',
    }),
    headers: {'content-type': 'application/json'},
  );
}

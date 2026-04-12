import 'package:smtp/src/domain/domain.dart';
import 'package:mailer/mailer.dart';

abstract final class SmtpMessageMapper {
  static Message toModel(
      {required SmtpMessageEntity from, required String username}) {
    return Message()
      ..from = Address(username, from.fromName)
      ..recipients.addAll(from.recipients)
      ..subject = from.subject
      ..text = from.text;
  }
}

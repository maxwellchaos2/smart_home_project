import 'package:smtp/src/domain/domain.dart';

abstract interface class ISmtpRepository {
  Future<void> sendMessage({
    required SmtpMessageEntity message,
  });
}

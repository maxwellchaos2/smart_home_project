import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:smtp/src/data/data.dart';
import 'package:smtp/src/domain/domain.dart';

abstract interface class ISmtpRemoteDatasource {
  Future<void> sendMessage({
    required SmtpMessageEntity message,
  });
}

final class SmtpRemoteDatasourceImpl implements ISmtpRemoteDatasource {
  const SmtpRemoteDatasourceImpl({required SmtpServer client})
      : _client = client;

  final SmtpServer _client;

  @override
  Future<void> sendMessage({
    required SmtpMessageEntity message,
  }) async {
    final mailMessage = SmtpMessageMapper.toModel(
      from: message,
      username: _client.username!,
    );
    await send(mailMessage, _client);
  }
}

import 'package:smtp/src/data/data.dart';
import 'package:smtp/src/domain/domain.dart';

final class SmtpRepositoryImpl implements ISmtpRepository {
  const SmtpRepositoryImpl({required ISmtpRemoteDatasource remoteSource})
      : _remoteSource = remoteSource;

  final ISmtpRemoteDatasource _remoteSource;

  @override
  Future<void> sendMessage({required SmtpMessageEntity message}) {
    return _remoteSource.sendMessage(message: message);
  }
}

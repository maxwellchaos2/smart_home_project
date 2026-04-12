import 'package:yandex_auth/src/data/data.dart';
import 'package:yandex_auth/src/domain/domain.dart';

final class YandexAuthRepositoryImpl implements IYandexAuthRepository {
  const YandexAuthRepositoryImpl({
    required IYandexAuthDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IYandexAuthDatasource _remoteSource;

  @override
  Future<void> signIn({
    required String code,
  }) {
    return _remoteSource.signIn(code: code);
  }

  @override
  Future<void> updateYandexDevices({
    required int projectId,
  }) {
    return _remoteSource.updateYandexDevices(
      projectId: projectId,
    );
  }

  @override
  Future<void> signOut() {
    return _remoteSource.signOut();
  }
}

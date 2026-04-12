import 'package:yandex_auth/src/data/data.dart';

abstract interface class IYandexAuthDatasource {
  Future<void> signIn({
    required String code,
  });

  Future<void> updateYandexDevices({
    required int projectId,
  });

  Future<void> signOut();
}

final class YandexAuthDatasourceImpl implements IYandexAuthDatasource {
  const YandexAuthDatasourceImpl({required YandexAuthApiClient client})
      : _client = client;

  final YandexAuthApiClient _client;

  @override
  Future<void> signIn({
    required String code,
  }) {
    return _client.signIn(code: code);
  }

  @override
  Future<void> updateYandexDevices({required int projectId}) {
    return _client.updateYandexDevices(
      projectId: projectId,
    );
  }

  @override
  Future<void> signOut() {
    return _client.signOut();
  }
}

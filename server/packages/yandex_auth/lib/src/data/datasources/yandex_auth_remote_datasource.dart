import 'dart:convert';

import 'package:yandex_auth/src/data/clients/yandex_auth_api_client.dart';
import 'package:yandex_auth/src/data/data.dart';
import 'package:yandex_auth/src/domain/domain.dart';

abstract interface class IYandexAuthRemoteDatasource {
  Future<YandexAuthTokenEntity> fetchToken({
    required String code,
  });

  Future<YandexAuthTokenEntity> refreshToken({
    required YandexAuthTokenEntity input,
  });

  Future<void> revokeToken({
    required String accessToken,
  });
}

final class YandexAuthRemoteDatasourceImpl
    implements IYandexAuthRemoteDatasource {
  const YandexAuthRemoteDatasourceImpl({required YandexAuthApiClient client})
      : _client = client;

  final YandexAuthApiClient _client;

  String _getclientAuth() {
    final clientId = '6135036a25204ffe9ac3d7c997304b34';
    final clientSecret = '18b5410c279a480ca2d494c53d3d9225';
    final clientAuth = '$clientId:$clientSecret';
    return 'Basic ${base64.encode(utf8.encode(clientAuth))}';
  }

  @override
  Future<YandexAuthTokenEntity> fetchToken({required String code}) async {
    final model = await _client.fetchToken(
      code: code,
      clientAuth: _getclientAuth(),
    );
    return YandexAuthTokenMapper.toEntity(from: model);
  }

  @override
  Future<YandexAuthTokenEntity> refreshToken(
      {required YandexAuthTokenEntity input}) async {
    final model = YandexAuthTokenMapper.toModel(from: input);
    final newModel = await _client.refreshToken(
      refreshToken: model.refreshToken,
      clientAuth: _getclientAuth(),
    );
    return YandexAuthTokenMapper.toEntity(from: newModel);
  }

  @override
  Future<void> revokeToken({required String accessToken}) async {
    await _client.revokeToken(
      accessToken: accessToken,
      clientAuth: _getclientAuth(),
    );
  }
}

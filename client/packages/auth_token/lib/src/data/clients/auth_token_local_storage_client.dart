import 'dart:convert';

import 'package:auth_token/src/data/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class IAuthTokenLocalStorageClient {
  Future<AuthTokenModel?> readToken();
  Future<void> writeToken({required AuthTokenModel token});
  Future<void> removeToken();
}

final class AuthTokenLocalStorageClientImpl
    implements IAuthTokenLocalStorageClient {
  final FlutterSecureStorage _storage;

  const AuthTokenLocalStorageClientImpl({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  final String _key = 'authToken';

  @override
  Future<AuthTokenModel?> readToken() async {
    final token = await _storage.read(key: _key);
    if (token == null) return null;
    return AuthTokenModel.fromJson(jsonDecode(token));
  }

  @override
  Future<void> writeToken({required AuthTokenModel token}) async {
    await _storage.write(key: _key, value: jsonEncode(token.toJson()));
  }

  @override
  Future<void> removeToken() async {
    await _storage.delete(key: _key);
  }
}

import 'package:auth_token/src/data/data.dart';
import 'package:auth_token/src/domain/domain.dart';
import 'package:common/common.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class AuthTokenDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IAuthTokenRepository getRepo({required GetIt locator}) {
    return AuthTokenRepositoryImpl(
      remoteSource: AuthTokenRemoteDatasourceImpl(
        client: AuthTokenApiClient(locator.get()),
      ),
      tokenLocalSource: const AuthTokenLocalDatasourceImpl(
        client: AuthTokenLocalStorageClientImpl(
          storage: FlutterSecureStorage(
              aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
            resetOnError: true, // Автоматически сбрасывать при ошибках
          )),
        ),
      ),
    );
  }
}

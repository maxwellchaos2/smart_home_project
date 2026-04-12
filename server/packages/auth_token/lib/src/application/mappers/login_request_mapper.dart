import 'package:auth_token/src/domain/domain.dart';

abstract final class LoginRequestMapper {
  static LoginRequestEntity toEntity({required Map from}) {
    return LoginRequestEntity(
      username: from['username'],
      password: from['password'],
    );
  }
}

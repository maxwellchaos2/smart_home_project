import 'package:auth_token/src/domain/domain.dart';

abstract final class LoginDeviceRequestMapper {
  static LoginDeviceRequestEntity toEntity({required Map from}) {
    return LoginDeviceRequestEntity(
      deviceId: from['deviceId'],
    );
  }
}

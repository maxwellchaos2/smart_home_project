import 'package:common/common.dart';

part 'login_device_request_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class LoginDeviceRequestEntity with _$LoginDeviceRequestEntity {
  const LoginDeviceRequestEntity._();

  const factory LoginDeviceRequestEntity({
    required int deviceId,
  }) = _LoginDeviceRequestEntity;
}

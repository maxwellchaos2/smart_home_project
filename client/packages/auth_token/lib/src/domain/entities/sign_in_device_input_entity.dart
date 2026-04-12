import 'package:common/common.dart';

part 'sign_in_device_input_entity.freezed.dart';

@freezed
sealed class SignInDeviceInputEntity with _$SignInDeviceInputEntity {
  const factory SignInDeviceInputEntity({
    required int deviceId,
  }) = _SignInDeviceInputEntity;
}

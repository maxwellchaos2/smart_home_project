import 'package:common/common.dart';

part 'sign_in_device_input_model.freezed.dart';
part 'sign_in_device_input_model.g.dart';

@Freezed(toJson: true)
sealed class SignInDeviceInputModel with _$SignInDeviceInputModel {
  const SignInDeviceInputModel._();

  const factory SignInDeviceInputModel({
    required int deviceId,
  }) = _SignInDeviceInputModel;

  @override
  Map<String, dynamic> toJson();
}

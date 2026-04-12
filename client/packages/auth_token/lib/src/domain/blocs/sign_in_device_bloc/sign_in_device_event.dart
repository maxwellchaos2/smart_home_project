part of 'sign_in_device_bloc.dart';

@freezed
class SignInDeviceEvent with _$SignInDeviceEvent {
  const factory SignInDeviceEvent.signIn({
    required SignInDeviceInputEntity input,
  }) = _SignIn;
}

part of 'sign_in_device_bloc.dart';

@freezed
sealed class SignInDeviceState with _$SignInDeviceState {
  const SignInDeviceState._();
  const factory SignInDeviceState.initial() = _Initial;
  const factory SignInDeviceState.loading() = _Loading;
  const factory SignInDeviceState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory SignInDeviceState.success({required AuthTokenEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

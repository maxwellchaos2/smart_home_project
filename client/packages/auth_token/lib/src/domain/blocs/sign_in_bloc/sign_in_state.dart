part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const SignInState._();
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory SignInState.success({required AuthTokenEntity data}) = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

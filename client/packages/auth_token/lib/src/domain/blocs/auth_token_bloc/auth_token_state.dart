part of 'auth_token_bloc.dart';

@freezed
class AuthTokenState with _$AuthTokenState {
  const AuthTokenState._();

  const factory AuthTokenState.initial({AuthTokenEntity? data}) = _Initial;
  const factory AuthTokenState.loading({AuthTokenEntity? data}) = _Loading;
  const factory AuthTokenState.failure(
      {AuthTokenEntity? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory AuthTokenState.success({required AuthTokenEntity? data}) =
      _Success;

  bool get hasData => data != null;
  bool get isAuth => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

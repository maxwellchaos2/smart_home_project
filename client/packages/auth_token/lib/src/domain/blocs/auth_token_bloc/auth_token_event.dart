part of 'auth_token_bloc.dart';

@freezed
class AuthTokenEvent with _$AuthTokenEvent {
  const factory AuthTokenEvent.fetch() = _Fetch;
  const factory AuthTokenEvent.revoke() = _Revoke;
  const factory AuthTokenEvent.update({required AuthTokenEntity? token}) =
      _Update;
  const factory AuthTokenEvent.changed({required AuthTokenEntity? token}) =
      _Changed;
}

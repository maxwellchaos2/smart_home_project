part of 'yandex_sign_in_bloc.dart';

@freezed
class YandexSignInEvent with _$YandexSignInEvent {
  const factory YandexSignInEvent.signIn({
    required String code,
  }) = _SignIn;
}

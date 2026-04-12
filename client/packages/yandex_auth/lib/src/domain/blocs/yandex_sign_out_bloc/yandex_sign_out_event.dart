part of 'yandex_sign_out_bloc.dart';

@freezed
class YandexSignOutEvent with _$YandexSignOutEvent {
  const factory YandexSignOutEvent.signOut() = _SignOut;
}

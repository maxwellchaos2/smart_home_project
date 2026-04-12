part of 'yandex_sign_in_bloc.dart';

@freezed
sealed class YandexSignInState with _$YandexSignInState {
  const YandexSignInState._();
  const factory YandexSignInState.initial() = _Initial;
  const factory YandexSignInState.loading() = _Loading;
  const factory YandexSignInState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory YandexSignInState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

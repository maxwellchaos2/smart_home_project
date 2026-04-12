part of 'yandex_sign_out_bloc.dart';

@freezed
sealed class YandexSignOutState with _$YandexSignOutState {
  const YandexSignOutState._();
  const factory YandexSignOutState.initial() = _Initial;
  const factory YandexSignOutState.loading() = _Loading;
  const factory YandexSignOutState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory YandexSignOutState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

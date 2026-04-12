part of 'update_yandex_devices_bloc.dart';

@freezed
sealed class UpdateYandexDevicesState with _$UpdateYandexDevicesState {
  const UpdateYandexDevicesState._();
  const factory UpdateYandexDevicesState.initial() = _Initial;
  const factory UpdateYandexDevicesState.loading() = _Loading;
  const factory UpdateYandexDevicesState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory UpdateYandexDevicesState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

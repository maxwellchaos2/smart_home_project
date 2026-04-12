part of 'wifi_name_bloc.dart';

@freezed
sealed class WifiNameState with _$WifiNameState {
  const WifiNameState._();
  const factory WifiNameState.initial({String? data}) = _Initial;
  const factory WifiNameState.loading({String? data}) = _Loading;
  const factory WifiNameState.failure(
      {String? data, @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory WifiNameState.success({required String? data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

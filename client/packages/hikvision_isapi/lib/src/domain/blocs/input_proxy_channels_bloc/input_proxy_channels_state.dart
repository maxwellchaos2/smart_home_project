part of 'input_proxy_channels_bloc.dart';

@freezed
sealed class InputProxyChannelsState with _$InputProxyChannelsState {
  const InputProxyChannelsState._();
  const factory InputProxyChannelsState.initial(
      {List<InputProxyChannelEntity>? data}) = _Initial;
  const factory InputProxyChannelsState.loading(
      {List<InputProxyChannelEntity>? data}) = _Loading;
  const factory InputProxyChannelsState.failure(
      {List<InputProxyChannelEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory InputProxyChannelsState.success(
      {required List<InputProxyChannelEntity> data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

part of 'input_proxy_channels_bloc.dart';

@freezed
class InputProxyChannelsEvent with _$InputProxyChannelsEvent {
  const factory InputProxyChannelsEvent.fetch() = _Fetch;
}
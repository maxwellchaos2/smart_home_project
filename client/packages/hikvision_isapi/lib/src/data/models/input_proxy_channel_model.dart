import 'package:common/common.dart';

part 'input_proxy_channel_model.freezed.dart';
part 'input_proxy_channel_model.g.dart';

@Freezed(fromJson: true)
sealed class InputProxyChannelModel with _$InputProxyChannelModel {
  const InputProxyChannelModel._();

  const factory InputProxyChannelModel({
    required String id,
    required String name,
  }) = _InputProxyChannelModel;

  factory InputProxyChannelModel.fromJson(Map<String, Object?> json) =>
      _$InputProxyChannelModelFromJson(json);
}

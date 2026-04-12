import 'package:common/common.dart';

part 'input_proxy_channel_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class InputProxyChannelEntity with _$InputProxyChannelEntity {
  const InputProxyChannelEntity._();

  const factory InputProxyChannelEntity({
    required String id,
    required String name,
  }) = _InputProxyChannelEntity;
}

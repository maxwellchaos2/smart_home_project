import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:users/users.dart';

part 'web_socket_message_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class WebSocketMessageEntity with _$WebSocketMessageEntity {
  const WebSocketMessageEntity._();

  const factory WebSocketMessageEntity({
    required Object message,
    required UserEntity? user,
    required DeviceEntity? device,
  }) = _WebSocketMessageEntity;
}

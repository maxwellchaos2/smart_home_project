import 'package:devices/devices.dart';
import 'package:users/users.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_core/src/domain/domain.dart';

abstract interface class IWebSocketRepository {
  void sendMessage(
    dynamic message, {
    WebSocketChannel? currentSocketChannel,
    String? topic,
    bool sendToAllPorts = true,
  });

  void addChannel(
    WebSocketChannel channel, {
    required UserEntity? user,
    required DeviceEntity? device,
  });

  void subscribe({required WebSocketChannel channel, required String topic});

  void removeChannel(WebSocketChannel channel);

  void $onMessageReceived(
    dynamic message, {
    required WebSocketChannel currentSocketChannel,
  });

  Stream<WebSocketMessageEntity> get onMessage;
}

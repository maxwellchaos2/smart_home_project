import 'dart:async';
import 'dart:convert';

import 'package:devices/devices.dart';
import 'package:users/users.dart';
import 'package:web_socket_channel/src/channel.dart';
import 'package:web_socket_core/src/domain/domain.dart';

final class WebSocketRepositoryImpl implements IWebSocketRepository {
  WebSocketRepositoryImpl();

  final Map<WebSocketChannel, UserEntity?> _connectedUserChannels = {};
  final Map<WebSocketChannel, DeviceEntity?> _connectedDeviceChannels = {};
  final Map<String, Set<WebSocketChannel>> _subscribedChannels = {};

  final StreamController<WebSocketMessageEntity> _onMessageController =
      StreamController<WebSocketMessageEntity>.broadcast();

  @override
  void addChannel(WebSocketChannel channel,
      {required UserEntity? user, required DeviceEntity? device}) {
    if (device != null) {
      _connectedDeviceChannels[channel] = device;
    } else {
      _connectedUserChannels[channel] = user;
    }
  }

  @override
  void removeChannel(WebSocketChannel channel) {
    _connectedUserChannels.remove(channel);
    _connectedDeviceChannels.remove(channel);

    for (var topic in _subscribedChannels.keys) {
      _subscribedChannels[topic]!.remove(channel);
    }
  }

  @override
  void subscribe({required WebSocketChannel channel, required String topic}) {
    if (_subscribedChannels.containsKey(topic)) {
      _subscribedChannels[topic]!.add(channel);
    } else {
      _subscribedChannels[topic] = {channel};
    }
  }

  @override
  void sendMessage(
    dynamic message, {
    WebSocketChannel? currentSocketChannel,
    String? topic,
    bool sendToAllPorts = true,
  }) {
    final messageString = jsonEncode(message);
    if (topic != null) {
      if (_subscribedChannels.containsKey(topic)) {
        for (var channel in _subscribedChannels[topic]!) {
          if (channel != currentSocketChannel) {
            channel.sink.add(messageString);
          }
        }
      }
    } else {
      for (var channel in _connectedUserChannels.keys) {
        if (channel != currentSocketChannel) {
          channel.sink.add(messageString);
        }
      }
      for (var channel in _connectedDeviceChannels.keys) {
        if (channel != currentSocketChannel) {
          channel.sink.add(messageString);
        }
      }
    }
    if (sendToAllPorts) {
      WebSocketIsolatesService.instance
          .sendMessageToAllPorts(message, topic: topic);
    }
  }

  @override
  void $onMessageReceived(dynamic message,
      {required WebSocketChannel currentSocketChannel}) {
    try {
      print(message);
      final msg = jsonDecode(message);

      _onMessageController.add(
        WebSocketMessageEntity(
          message: msg,
          user: _connectedUserChannels[currentSocketChannel],
          device: _connectedDeviceChannels[currentSocketChannel],
        ),
      );
    } catch (e) {
      print(e);
      if (!_connectedUserChannels.containsKey(currentSocketChannel)) {
        return;
      }
      sendMessage(
        [
          {
            'type': 'error',
            'message': e.toString(),
          }
        ],
        topic: 'user-${_connectedUserChannels[currentSocketChannel]!.id}',
      );
    }
  }

  @override
  Stream<WebSocketMessageEntity> get onMessage => _onMessageController.stream;
}

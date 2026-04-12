import 'dart:isolate';

import 'package:web_socket_core/src/domain/domain.dart';

final class WebSocketIsolatesService {
  WebSocketIsolatesService._();

  static final WebSocketIsolatesService instance = WebSocketIsolatesService._();

  final List<SendPort> _sendPorts = [];

  void sendMessageToAllPorts(dynamic message, {String? topic}) {
    // Отправляем сообщение в другие изоляты
    for (var sendPort in _sendPorts) {
      sendPort.send({
        'isolateName': Isolate.current.debugName,
        'message': message,
        'topic': topic,
      });
    }
  }

  SendPort getNewSendPort() {
    ReceivePort receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is SendPort) {
        _addSendPort(message);
      }
    });

    return receivePort.sendPort;
  }

  void startInIsolate(SendPort sendPort, IWebSocketRepository repository) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((message) {
      handleIsolateMessage(message, repository);
    });
  }

  void _addSendPort(SendPort sendPort) {
    _sendPorts.add(sendPort);
    // Отправляем обновленный список всех SendPort всем изолятам
    for (var sendPort in _sendPorts) {
      sendPort.send(_sendPorts);
    }
  }

  void handleIsolateMessage(dynamic message, IWebSocketRepository repository) {
    if (message is List<SendPort>) {
      // Обновляем список всех SendPort
      _sendPorts.clear();
      _sendPorts.addAll(message);
    } else if (message is Map<String, dynamic>) {
      // Пересылаем сообщение всем подключенным пользователям
      final isolateName = message['isolateName'];
      final msg = message['message'];
      if (isolateName == Isolate.current.debugName) {
        return;
      }
      repository.sendMessage(msg,
          topic: message['topic'], sendToAllPorts: false);
    }
  }
}

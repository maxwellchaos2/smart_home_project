import 'dart:async';
import 'dart:convert';

import 'package:common/common.dart';
import 'package:events/src/data/data.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class IEventsWebsocketClient {
  Future<void> init();

  Future<void> sendMessages({
    required List<EventMessageInputModel> messages,
  });

  Stream<List<EventModel>> get onEvents;

  void dispose();
}

final class EventsWebsocketClientImpl implements IEventsWebsocketClient {
  EventsWebsocketClientImpl({
    required this.uri,
    required this.getAuthToken,
  });

  final Uri uri;
  final Future<String> Function() getAuthToken;

  WebSocketChannel? channel;

  final StreamController<List<EventModel>> _controller =
      StreamController<List<EventModel>>.broadcast();

  StreamSubscription? _sub;
  Timer? _reconnectTimer;

  bool _disposed = false;
  bool _isConnecting = false;
  bool _isConnected = false;
  int _reconnectAttempts = 0;
  static const double _maxReconnectAttempts = double.infinity;
  static const Duration _baseReconnectDelay = Duration(seconds: 2);

  void _broadcast() {
    final currentChannel = channel;
    if (currentChannel == null) return;

    _sub?.cancel();
    _sub = currentChannel.stream.listen(
      (event) {
        try {
          final events = jsonDecode(event) as List;
          _controller.add(events.map((e) => EventModel.fromJson(e)).toList());
          _reconnectAttempts =
              0; // Сбрасываем счетчик при успешном получении данных
        } catch (e) {
          debugPrint('Ошибка парсинга события: $e');
        }
      },
      onError: (e) {
        debugPrint('WebSocket ошибка: $e');
        _isConnected = false;
        _closeCurrentConnection();
        _scheduleReconnect();
      },
      onDone: () {
        debugPrint('WebSocket соединение закрыто');
        _isConnected = false;
        _closeCurrentConnection();
        _scheduleReconnect();
      },
    );
  }

  @override
  Future<void> init() async {
    if (_disposed || _isConnecting) return;

    _disposed = false;
    await _connect();
  }

  void _closeCurrentConnection() {
    _sub?.cancel();
    _sub = null;
    channel?.sink.close();
    channel = null;
  }

  void _scheduleReconnect() {
    if (_disposed) return;

    _reconnectTimer?.cancel();

    if (_reconnectAttempts >= _maxReconnectAttempts) {
      debugPrint(
          'Достигнут лимит попыток переподключения ($_maxReconnectAttempts)');
      return;
    }

    final delay = Duration(
      seconds: (_baseReconnectDelay.inSeconds * (1 << _reconnectAttempts))
          .clamp(1, 60),
    );

    debugPrint(
        'Переподключение через ${delay.inSeconds} секунд (попытка ${_reconnectAttempts + 1})');

    _reconnectTimer = Timer(delay, () {
      if (!_disposed) {
        _reconnectAttempts++;
        init();
      }
    });
  }

  @override
  Future<void> sendMessages({
    required List<EventMessageInputModel> messages,
  }) async {
    if (_disposed || !_isConnected) {
      throw Exception('WebSocket не подключен');
    }

    final currentChannel = channel;
    if (currentChannel == null) {
      throw Exception('WebSocket channel не инициализирован');
    }

    final json = jsonEncode(messages.map((m) => m.toJson()).toList());
    int countTry = 0;
    while (countTry < 3 && !_disposed && _isConnected) {
      try {
        await currentChannel.ready;
        currentChannel.sink.add(json);
        break;
      } catch (e) {
        debugPrint('Ошибка отправки сообщения: $e');
        await Future.delayed(Duration(seconds: 1));
        countTry++;

        // Если соединение разорвалось, пытаемся переподключиться
        if (!_isConnected) {
          _scheduleReconnect();
          break;
        }
      }
    }

    if (countTry == 3) {
      throw Exception('Failed to send messages after 3 attempts: $json');
    }
  }

  Future<void> _connect() async {
    if (_disposed || _isConnecting) return;

    _isConnecting = true;
    _isConnected = false;

    try {
      final token = await getAuthToken();
      final newChannel = WebSocketChannel.connect(
        uri.replace(
          queryParameters: {
            'authToken': token,
          },
        ),
      );

      await newChannel.ready;

      // Успешное подключение
      _closeCurrentConnection(); // Закрываем старое соединение если есть
      channel = newChannel;
      _isConnected = true;
      _isConnecting = false;
      _reconnectAttempts = 0;

      debugPrint('WebSocket успешно подключен');

      // Начинаем слушать события
      _broadcast();
    } catch (e) {
      debugPrint('Ошибка подключения WebSocket: $e');
      _isConnecting = false;
      _isConnected = false;

      if (!_disposed) {
        _scheduleReconnect();
      }
    }
  }

  @override
  Stream<List<EventModel>> get onEvents => _controller.stream;

  @override
  void dispose() {
    _disposed = true;
    _isConnected = false;
    _isConnecting = false;

    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    _controller.close();
    _closeCurrentConnection();
  }
}

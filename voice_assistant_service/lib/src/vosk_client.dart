import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class VoskClient {
  final String url;

  VoskClient(this.url);
  WebSocket? _socket;

  final StreamController<VoskMessage> _messageController =
      StreamController<VoskMessage>.broadcast();

  Stream<VoskMessage> get onMessage => _messageController.stream;

  Future<void> connect() async {
    // Логика подключения к Vosk серверу
    _socket = await WebSocket.connect(url);
    print("✅ Подключение к Vosk серверу успешно!");

    // Отправляем конфигурацию перед началом передачи аудио
    // Отправляем список команд (grammar)
    _socket!.add(jsonEncode({
      'config': {
        'sample_rate': 16000,
        'grammar': [
          'кузя',
          "включи светильники",
          "выключи светильники",
          "включи кондиционер",
          "выключи кондиционер",
          "включи телевизор",
          "выключи телевизор",
        ],
      }
    }));
    print("📤 Конфигурация отправлена");

    // Обрабатываем ответы от Vosk
    _socket!.listen((event) {
      try {
        final data = jsonDecode(event);
        VoskMessage message = VoskMessage.fromJson(data);
        // final partial = data["partial"] ?? "";
        _messageController.add(message);
      } catch (e) {
        // Игнорируем ошибки парсинга JSON для чистоты лога
      }
    }, onError: (error) {
      print("❌ Ошибка WebSocket: $error");
    });
  }

  void sendAudio(Uint8List audioData) {
    // Логика отправки аудио данных на сервер
    _socket?.add(audioData);
  }

  void close() {
    // Логика закрытия соединения
    _socket?.close();
  }
}

class VoskMessage {
  final String text;
  final String partial;

  VoskMessage({required this.text, required this.partial});

  factory VoskMessage.fromJson(Map<String, dynamic> json) {
    return VoskMessage(
      text: json['text'] ?? '',
      partial: json['partial'] ?? '',
    );
  }
}

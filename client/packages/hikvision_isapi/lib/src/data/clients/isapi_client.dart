import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:hikvision_isapi/src/data/clients/clients.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

abstract interface class IISAPIClient {
  Stream<Map<String, dynamic>> listenEvents();
  Future<Map<String, dynamic>> get();
  Future<String> postXml(String xmlBody);
  void dispose();
}

final class ISAPIClientImpl implements IISAPIClient {
  ISAPIClientImpl({
    required this.getClient,
    required this.url,
    this.reconnectDelay = const Duration(seconds: 5),
    this.maxReconnectAttempts = -1, // -1 для бесконечных попыток
    this.connectionTimeout = const Duration(seconds: 30),
  });
  final Duration reconnectDelay;
  final int maxReconnectAttempts;
  final Duration connectionTimeout;

  StreamController<Map<String, dynamic>>? _eventsController;
  Timer? _reconnectTimer;
  bool _isDisposed = false;
  int _reconnectAttempts = 0;
  final DigestAuthClient Function() getClient;
  final String url;

  @override
  Future<Map<String, dynamic>> get() async {
    final response = await getClient().get(
      Uri.parse(url),
    );
    final xml2json = Xml2Json();
    xml2json.parse(response.body);
    final data = jsonDecode(xml2json.toParker());
    if (data.containsKey('ResponseStatus')) {
      return data['ResponseStatus'] as Map<String, dynamic>;
    } else {
      return data;
    }
  }

  @override
  Future<String> postXml(String xmlBody) async {
    final response = await getClient().post(
      Uri.parse(url),
      body: xmlBody,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw HttpException(
        'HTTP ${response.statusCode}: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Stream<Map<String, dynamic>> listenEvents() {
    _eventsController ??= StreamController<Map<String, dynamic>>.broadcast(
      onCancel: () => _stopListening(),
    );

    // Запускаем подключение, если оно еще не запущено
    if (!_eventsController!.isClosed) {
      _startListening();
    }

    return _eventsController!.stream;
  }

  void _startListening() async {
    if (_isDisposed) return;

    String buffer = '';
    StreamSubscription? subscription;

    try {
      print(
          'Connecting to event stream... (attempt ${_reconnectAttempts + 1})');

      final request = await (getClient()
          .send(Request(
            'GET',
            Uri.parse(
              url,
            ),
          ))
          .timeout(connectionTimeout));

      if (request.statusCode == 200) {
        print('Successfully connected to event stream');
        _reconnectAttempts = 0;

        subscription = request.stream
            .timeout(
              Duration(seconds: 60),
              onTimeout: (sink) {
                print('Stream timeout - no data received for 60 seconds');
                sink.addError(TimeoutException(
                    'No data received', Duration(seconds: 60)));
              },
            )
            .transform(utf8.decoder)
            .listen(
              (chunk) {
                if (_isDisposed) return;

                buffer += chunk;

                // Обрабатываем MIME части
                _processMimeBuffer(buffer);

                // Очищаем обработанные данные
                buffer = _cleanMimeBuffer(buffer);
              },
              onError: (error) {
                print('Stream error: $error');
                _scheduleReconnect();
              },
              onDone: () {
                print('Stream closed by server');
                _scheduleReconnect();
              },
            );
      } else {
        throw HttpException('HTTP ${request.statusCode}');
      }
    } catch (error) {
      print('Connection error: $error');
      subscription?.cancel();
      _scheduleReconnect();
    }
  }

  void _processMimeBuffer(String buffer) {
    // Ищем MIME части между границами
    final boundaryPattern = RegExp(r'--MIME_boundary\s*');
    final parts = buffer.split(boundaryPattern);

    for (int i = 1; i < parts.length - 1; i++) {
      // Пропускаем первую и последнюю части
      final part = parts[i].trim();
      if (part.isEmpty) continue;

      // Извлекаем JSON из MIME части
      final jsonString = _extractJsonFromMimePart(part);
      if (jsonString != null) {
        final event = _parseJsonEvent(jsonString);
        if (event != null && !_isDisposed) {
          _eventsController?.add(event);
        }
      }
    }
  }

  String? _extractJsonFromMimePart(String mimePart) {
    // Ищем начало JSON после заголовков MIME
    final lines = mimePart.split('\n');
    bool inJson = false;
    final jsonLines = <String>[];

    for (final line in lines) {
      // Пропускаем заголовки до пустой строки
      if (!inJson) {
        if (line.trim().isEmpty) {
          inJson = true;
        }
        continue;
      }

      // Собираем JSON строки
      jsonLines.add(line);
    }

    final jsonString = jsonLines.join('\n').trim();
    return jsonString.isNotEmpty ? jsonString : null;
  }

  String _cleanMimeBuffer(String buffer) {
    // Оставляем только данные после последней полной границы
    final lastBoundaryIndex = buffer.lastIndexOf('--MIME_boundary');
    if (lastBoundaryIndex != -1) {
      // Проверяем, есть ли полная MIME часть после последней границы
      final afterBoundary = buffer.substring(lastBoundaryIndex);
      if (afterBoundary.contains('\n\n') &&
          afterBoundary.contains('--MIME_boundary')) {
        // Есть завершенная часть, оставляем только незавершенную
        final nextBoundaryIndex =
            buffer.indexOf('--MIME_boundary', lastBoundaryIndex + 1);
        if (nextBoundaryIndex != -1) {
          return buffer.substring(nextBoundaryIndex);
        }
      }
      return buffer.substring(lastBoundaryIndex);
    }

    // Если буфер слишком большой, обрезаем
    if (buffer.length > 20000) {
      return buffer.substring(buffer.length - 5000);
    }

    return buffer;
  }

  Map<String, dynamic>? _parseJsonEvent(String jsonString) {
    if (jsonString.isEmpty) return null;

    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      print('JSON parsing error: $e');
      print('Received data was: $jsonString');
      return null;
    }
  }

  void _scheduleReconnect() {
    if (_isDisposed) return;

    _reconnectTimer?.cancel();

    // Проверяем лимит попыток переподключения
    if (maxReconnectAttempts != -1 &&
        _reconnectAttempts >= maxReconnectAttempts) {
      print('Max reconnect attempts reached. Stopping.');
      _eventsController?.addError(
          Exception('Max reconnect attempts ($maxReconnectAttempts) reached'));
      return;
    }

    _reconnectAttempts++;

    print('Scheduling reconnect in ${reconnectDelay.inSeconds} seconds...');
    _reconnectTimer = Timer(reconnectDelay, () {
      if (!_isDisposed) {
        _startListening();
      }
    });
  }

  void _stopListening() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }

  @override
  void dispose() {
    _isDisposed = true;
    _stopListening();
    _eventsController?.close();
    _eventsController = null;
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class LogoSiemensStateChange {
  final String id;
  final String desc;
  final List<int> value;

  LogoSiemensStateChange({
    required this.id,
    required this.desc,
    required this.value,
  });

  factory LogoSiemensStateChange.fromJson(
    String id,
    Map<String, dynamic> json,
  ) {
    return LogoSiemensStateChange(
      id: id,
      desc: json['desc'] ?? '',
      value: List<int>.from(json['value'] ?? []),
    );
  }
}

class LogoSiemensController {
  MqttServerClient? _client;
  final StreamController<LogoSiemensStateChange> _changedStateController =
      StreamController<LogoSiemensStateChange>.broadcast();

  /// Stream событий изменения состояния
  Stream<LogoSiemensStateChange> get changedStateStream =>
      _changedStateController.stream;

  /// Подключается к MQTT брокеру и подписывается на топик logo/events
  Future<void> connect({
    required String mqttHost,
    required int mqttHostPort,
    String clientId = 'logo_siemens_service',
  }) async {
    try {
      _client = MqttServerClient(mqttHost, clientId);
      _client!.port = mqttHostPort;
      _client!.logging(on: true);
      _client!.keepAlivePeriod = 20;
      _client!.onDisconnected = _onDisconnected;
      _client!.onConnected = _onConnected;
      _client!.onSubscribed = _onSubscribed;

      final connMessage = MqttConnectMessage()
          .withClientIdentifier(clientId)
          .withWillTopic('logo/status')
          .withWillMessage('$clientId disconnected')
          .startClean()
          .withWillQos(MqttQos.atLeastOnce);

      _client!.connectionMessage = connMessage;

      await _client!.connect();

      if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
        print('LogoSiemensController: Connected to MQTT broker');

        // Подписываемся на топик logo/events
        _client!.subscribe('logo/events', MqttQos.atLeastOnce);

        // Обрабатываем входящие сообщения
        _client!.updates!.listen(_onMessage);
      } else {
        print('LogoSiemensController: Failed to connect to MQTT broker');
        throw Exception('Failed to connect to MQTT broker');
      }
    } catch (e) {
      print('LogoSiemensController: Connection error: $e');
      rethrow;
    }
  }

  /// Обновляет состояние устройства
  Future<void> updateState(String stateId, List<int> value) async {
    if (_client == null ||
        _client!.connectionStatus!.state != MqttConnectionState.connected) {
      throw Exception('MQTT client is not connected');
    }

    final command = {
      'state': {
        stateId: {'value': value},
      },
    };

    final message = jsonEncode(command);
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    _client!.publishMessage(
      'logo/commands',
      MqttQos.atLeastOnce,
      builder.payload!,
    );

    print('LogoSiemensController: Sent command to $stateId: $value');
  }

  /// Отключается от MQTT брокера
  Future<void> disconnect() async {
    if (_client != null) {
      _client!.disconnect();
    }
    await _changedStateController.close();
  }

  void _onConnected() {
    print('LogoSiemensController: MQTT client connected');
  }

  void _onDisconnected() {
    print('LogoSiemensController: MQTT client disconnected');
  }

  void _onSubscribed(String topic) {
    print('LogoSiemensController: Subscribed to topic: $topic');
  }

  void _onMessage(List<MqttReceivedMessage<MqttMessage?>> messages) {
    for (final message in messages) {
      final topic = message.topic;
      final payload = message.payload as MqttPublishMessage;
      final messageText = MqttPublishPayload.bytesToStringAsString(
        payload.payload.message,
      );

      if (topic == 'logo/events') {
        _handleLogoEvent(messageText);
      }
    }
  }

  void _handleLogoEvent(String messageText) {
    try {
      final data = jsonDecode(messageText) as Map<String, dynamic>;
      final state = data['state']?['reported'] as Map<String, dynamic>?;

      if (state != null) {
        for (final entry in state.entries) {
          final stateId = entry.key;
          if (entry.value is! Map<String, dynamic>) continue;
          final stateData = entry.value as Map<String, dynamic>;

          if (stateData['value'] == null) continue;

          final stateChange = LogoSiemensStateChange.fromJson(
            stateId,
            stateData,
          );
          _changedStateController.add(stateChange);

          print(
            'LogoSiemensController: State changed - ID: $stateId, Value: ${stateChange.value}',
          );
        }
      }
    } catch (e) {
      print('LogoSiemensController: Error parsing logo event: $e');
      print('LogoSiemensController: Message: $messageText');
    }
  }
}

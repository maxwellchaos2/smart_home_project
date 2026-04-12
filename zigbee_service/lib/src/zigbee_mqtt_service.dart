import 'dart:async';
import 'dart:convert';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:zigbee_devices/zigbee_devices.dart';

class ZigbeeMqttService {
  final String broker;
  final int port;
  final String clientId;

  late MqttServerClient _client;
  final _controller = StreamController<ZigbeeMessage>.broadcast();
  final _devicesController =
      StreamController<List<ZigbeeDeviceModel>>.broadcast();

  final _deviceInterviewedController =
      StreamController<ZigbeeDeviceModel>.broadcast();

  List<Map<String, dynamic>> _cachedDevices = [];

  Stream<ZigbeeMessage> get messages => _controller.stream;
  Stream<List<ZigbeeDeviceModel>> get devicesStream =>
      _devicesController.stream;

  Stream<ZigbeeDeviceModel> get deviceInterviewed =>
      _deviceInterviewedController.stream;

  ZigbeeMqttService({
    required this.broker,
    this.port = 1883,
    this.clientId = 'dart_zigbee',
  });

  Future<void> connect() async {
    _client = MqttServerClient(broker, clientId);
    _client.port = port;
    _client.logging(on: false);

    _client.connectionMessage =
        MqttConnectMessage().withClientIdentifier(clientId).startClean();

    try {
      await _client.connect();
      _client.subscribe('zigbee2mqtt/#', MqttQos.atMostOnce);

      _client.updates?.listen((messages) async {
        final recMess = messages[0].payload as MqttPublishMessage;
        final pt = MqttPublishPayload.bytesToStringAsString(
          recMess.payload.message,
        );
        final topic = messages[0].topic;

        if (topic == 'zigbee2mqtt/bridge/devices') {
          try {
            final data = jsonDecode(pt) as List;
            _cachedDevices = List<Map<String, dynamic>>.from(data);
            final devices = data
                .map((d) => ZigbeeDeviceModel.fromJson(d))
                .where((d) => d.friendlyName != 'Coordinator')
                .toList();
            _devicesController.add(devices);
          } catch (_) {}
        } else if (topic == 'zigbee2mqtt/bridge/event') {
          try {
            final data = jsonDecode(pt);
            if (data['type'] == 'device_interview' &&
                data['data']['status'] == 'successful') {
              final cashedDevice = _cachedDevices.firstWhere(
                (d) => d['ieee_address'] == data['data']['ieee_address'],
              );

              // Уже есть такое устройство
              _deviceInterviewedController.add(
                ZigbeeDeviceModel.fromJson({
                  ...cashedDevice,
                  ...data['data'],
                }),
              );
              // getDevice(data['data']['friendly_name']);
              // getDevices();
              // await Future.delayed(const Duration(seconds: 1));
              // getDeviceState(data['data']['friendly_name']);
            }
          } catch (_) {}
        }

        _controller.add(ZigbeeMessage(topic: topic, payload: pt));
      });
    } catch (e) {
      throw Exception('Ошибка подключения к MQTT: $e');
    }
  }

  /// Разрешить присоединение новых устройств на [duration] секунд.
  /// По умолчанию 4 минут.
  void permitJoin({int duration = 4 * 60, bool value = true}) {
    final builder = MqttClientPayloadBuilder();
    final command = {"time": duration, "value": value};
    builder.addString(jsonEncode(command));
    _client.publishMessage(
      'zigbee2mqtt/bridge/request/permit_join',
      MqttQos.atMostOnce,
      builder.payload!,
    );
  }

  void getDevice(String device) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('');
    _client.publishMessage(
      'zigbee2mqtt/bridge/request/device/$device',
      MqttQos.atMostOnce,
      builder.payload!,
    );
  }

  void getDevices() {
    final builder = MqttClientPayloadBuilder();
    builder.addString(jsonEncode({}));
    _client.publishMessage(
      'zigbee2mqtt/bridge/request/devices',
      MqttQos.atMostOnce,
      builder.payload!,
    );
  }

  void getDeviceState(String device) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('{}');
    _client.publishMessage(
      'zigbee2mqtt/$device/get',
      MqttQos.atMostOnce,
      builder.payload!,
    );
  }

  void getDeviceAvailability(String device) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('');
    _client.publishMessage(
      'zigbee2mqtt/$device/availability',
      MqttQos.atMostOnce,
      builder.payload!,
    );
  }

  void sendCommand(String device, Map<String, dynamic> command) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(jsonEncode(command));
    _client.publishMessage(
      'zigbee2mqtt/$device/set',
      MqttQos.atMostOnce,
      builder.payload!,
    );
  }

  void turnOn(String device) => sendCommand(device, {"state": "ON"});
  void turnOff(String device) => sendCommand(device, {"state": "OFF"});
  void setBrightness(String device, int brightness) =>
      sendCommand(device, {"brightness": brightness});
  void setColor(String device, String hexColor) => sendCommand(device, {
        "color": {"hex": hexColor},
      });

  void disconnect() {
    _client.disconnect();
    _controller.close();
    _devicesController.close();
    _deviceInterviewedController.close();
  }
}

class ZigbeeMessage {
  final String topic;
  final String payload;

  ZigbeeMessage({required this.topic, required this.payload});
}

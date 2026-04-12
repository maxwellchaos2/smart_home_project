import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BLEDeviceController extends ChangeNotifier {
  BLEDeviceController();

  BluetoothDevice? _targetDevice;
  BluetoothCharacteristic? _targetCharacteristic;
  final String _serviceUuid = "b8c4cda2-03de-41cf-9b74-8a9b68c116cb";
  final String _characteristicUuid = "0000a100-0000-1000-8000-00805f9b34fb";
  bool? _bleEnabled;

  bool? get bleEnabled => _bleEnabled;
  bool get isConnected => _targetDevice != null;

  StreamSubscription? deviceStateSubscription;

  void init() async {
    if (await FlutterBluePlus.isSupported == false) {
      debugPrint("BLE not supported");
    }
    deviceStateSubscription =
        FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
        _bleEnabled = true;
        notifyListeners();
        startScan();
      } else if (state == BluetoothAdapterState.off) {
        _bleEnabled = false;
        notifyListeners();
      }
    });
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }
  }

  void startScan() async {
    // На Android 12+ требуется запрашивать BLUETOOTH_SCAN и BLUETOOTH_CONNECT
    if (Platform.isAndroid) {
      try {
        final scanStatus = await Permission.bluetoothScan.status;
        final connectStatus = await Permission.bluetoothConnect.status;
        final locationStatus = await Permission.locationWhenInUse.status;

        // Запрашиваем необходимые разрешения, если не предоставлены
        if (!scanStatus.isGranted) {
          final r = await Permission.bluetoothScan.request();
          if (!r.isGranted) {
            if (r.isPermanentlyDenied) await openAppSettings();
            debugPrint('BLE scan permission not granted: $r');
            return;
          }
        }
        if (!connectStatus.isGranted) {
          final r = await Permission.bluetoothConnect.request();
          if (!r.isGranted) {
            if (r.isPermanentlyDenied) await openAppSettings();
            debugPrint('BLE connect permission not granted: $r');
            return;
          }
        }
        // Для совместимости со старыми устройствами может потребоваться геолокация
        if (!locationStatus.isGranted) {
          final r = await Permission.locationWhenInUse.request();
          if (!r.isGranted) {
            if (r.isPermanentlyDenied) await openAppSettings();
            debugPrint('Location permission not granted: $r');
            // Не прерываем — иногда сканирование работает без location на новых Android
          }
        }
      } catch (e) {
        debugPrint('Ошибка при запросе BLE разрешений: $e');
      }
    }

    FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 5),
      // withServices: [
      //   Guid(serviceUuid),
      // ],
    );
    late StreamSubscription<List<ScanResult>> sub;
    bool isFound = false;
    sub = FlutterBluePlus.scanResults.listen((results) async {
      if (isFound) return;
      for (var r in results) {
        if (r.device.platformName != "smart-hub" &&
            r.device.platformName != "smart-home-wifi-connect") {
          continue;
        }
        debugPrint(
            '${r.device.platformName}' ' ${r.device.remoteId} RSSI: ${r.rssi}');
        isFound = true;
        await Future.delayed(Duration(seconds: 2));
        FlutterBluePlus.stopScan();
        await connectAndSend(r.device);
        sub.cancel();
        return;
      }
    });
  }

  Future<void> connectAndSend(BluetoothDevice device) async {
    if (_targetDevice != null) return;
    int attempt = 0;
    while (attempt < 3) {
      try {
        await device.connect(license: License.free, autoConnect: false);
        break;
      } catch (e) {
        debugPrint(e.toString());
        attempt++;
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    final services = await device.discoverServices();
    for (var s in services) {
      if (s.uuid.toString().toLowerCase() == _serviceUuid.toLowerCase()) {
        for (var c in s.characteristics) {
          if (c.uuid.str128.toLowerCase() ==
              _characteristicUuid.toLowerCase()) {
            _targetCharacteristic = c;
            _targetDevice = device;
            notifyListeners();
            break;
          }
        }
      }
    }
  }

  Future<({BLEDeviceType deviceType, String deviceIp})?> sendWifiConfig({
    required String ssid,
    required String password,
  }) async {
    final completer =
        Completer<({BLEDeviceType deviceType, String deviceIp})?>();
    if (_targetCharacteristic == null) return null;
    await _targetCharacteristic!.setNotifyValue(true);

    final message =
        json.encode({"cmd": "wifi", "ssid": ssid, "pass": password});
    await _targetCharacteristic!
        .write(utf8.encode(message), withoutResponse: true);
    debugPrint("Sent WiFi config to ${_targetDevice?.platformName}");
    // Слушаем уведомления
    final sub = _targetCharacteristic!.lastValueStream.listen((value) {
      if (value.isEmpty) return;
      final msg = json.decode(utf8.decode(value));
      if (msg['status'] == 'wifi_ok') {
        debugPrint("✅ Wi-Fi настройки успешно применены!");
        if (msg['device_type'] == 'smart_hub') {
          if (completer.isCompleted == false) {
            completer.complete((
              deviceType: BLEDeviceType.smartHub,
              deviceIp: msg['device_ip'] as String,
            ));
          }
        }
        if (msg['device_type'] == 'control_box_hub') {
          if (completer.isCompleted == false) {
            completer.complete((
              deviceType: BLEDeviceType.controlBoxHub,
              deviceIp: msg['device_ip'] as String,
            ));
          }
        } else if (msg['device_type'] == 'led_lamp') {
          if (completer.isCompleted == false) {
            completer.complete((
              deviceType: BLEDeviceType.ledLamp,
              deviceIp: msg['device_ip'] as String,
            ));
          }
          // createLedDevice();
        }
      } else if (msg['status'] == 'wifi_fail') {
        debugPrint("❌ Ошибка при применении Wi-Fi");
        if (completer.isCompleted == false) {
          completer.completeError("Ошибка при применении Wi-Fi");
        }
      }
    });
    final result = await completer.future;
    sub.cancel();
    return result;
  }

  Future<void> sendAuthToken({
    required String token,
    required int deviceId,
    required int projectId,
  }) async {
    final completer = Completer<void>();
    if (_targetCharacteristic == null) return;
    await _targetCharacteristic!.setNotifyValue(true);
    final message = json.encode({
      "cmd": "auth_token",
      "value": token,
      "device_id": deviceId,
      "project_id": projectId,
    });
    await _targetCharacteristic!
        .write(utf8.encode(message), withoutResponse: true);
    debugPrint("Sent auth token to ${_targetDevice?.platformName}");
    // Слушаем уведомления
    final sub = _targetCharacteristic!.lastValueStream.listen((value) async {
      if (value.isEmpty) return;
      final msg = json.decode(utf8.decode(value));
      if (msg['status'] == 'token_saved') {
        debugPrint("✅ Токен успешно применен!");
        if (completer.isCompleted == false) {
          completer.complete();
        }
      } else if (msg['status'] == 'token_fail') {
        debugPrint("❌ Ошибка при применении токена");
        if (completer.isCompleted == false) {
          completer.completeError("Ошибка при применении токена");
        }
      }
    });
    await completer.future;
    sub.cancel();
  }

  @override
  void dispose() {
    deviceStateSubscription?.cancel();
    super.dispose();
  }
}

enum BLEDeviceType {
  smartHub,
  ledLamp,
  controlBoxHub,
}

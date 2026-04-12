import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bluez/bluez.dart';
import 'package:dbus/dbus.dart';

/// BLE Server расширение для bluez пакета
/// Добавляет серверную функциональность через прямую работу с D-Bus
class BleGateway {
  static const String serviceUuid = 'b8c4cda2-03de-41cf-9b74-8a9b68c116cb';
  static const String characteristicUuid =
      '0000a100-0000-1000-8000-00805f9b34fb';

  BlueZClient? _client;
  DBusClient? _bus;
  _GattApplication? _application;
  _GattService? _service;
  _GattCharacteristic? _characteristic;
  _Advertisement? _advertisement;

  // Обработчик входящих сообщений
  Function(Map<String, dynamic>)? onMessage;

  bool _isRunning = false;
  StreamController<Map<String, dynamic>>? _messageController;

  /// Поток для получения сообщений от BLE клиентов
  Stream<Map<String, dynamic>> get messageStream =>
      _messageController?.stream ?? const Stream.empty();

  /// Инициализация и запуск BLE Gateway
  Future<void> start() async {
    if (_isRunning) {
      print('BLE Gateway уже запущен');
      return;
    }

    try {
      print('Запуск BLE Gateway...');

      // Настраиваем Bluetooth как обнаруживаемый с неограниченным временем
      await _setBluetoothDiscoverable(true);

      _messageController = StreamController<Map<String, dynamic>>.broadcast();

      // Подключаемся к D-Bus системной шине
      _bus = DBusClient.system();

      // Используем существующий BlueZ клиент для адаптеров
      _client = BlueZClient();
      await _client!.connect();

      // Создаем GATT приложение
      await _createGattApplication();

      // Регистрируем приложение через BlueZ
      await _registerApplication();

      // Запускаем рекламу
      await _startAdvertising();

      _isRunning = true;
      print('BLE Gateway успешно запущен');
    } catch (e) {
      print('Ошибка запуска BLE Gateway: $e');

      // На macOS или при отсутствии BlueZ переходим в режим эмуляции
      if (Platform.isMacOS || e.toString().contains('D-Bus')) {
        print('Переход в режим эмуляции BLE Gateway');
        _messageController = StreamController<Map<String, dynamic>>.broadcast();
        _isRunning = true;
      } else {
        rethrow;
      }
    }
  }

  /// Остановка BLE Gateway
  Future<void> stop() async {
    if (!_isRunning) return;

    try {
      print('Остановка BLE Gateway...');

      await _stopAdvertising();
      await _unregisterApplication();

      // Отключаем обнаружимость Bluetooth
      await _setBluetoothDiscoverable(false);

      await _messageController?.close();
      await _client?.close();
      await _bus?.close();

      _isRunning = false;
      print('BLE Gateway остановлен');
    } catch (e) {
      print('Ошибка остановки BLE Gateway: $e');
    }
  }

  /// Отправка сообщения через BLE
  Future<void> sendMessage(Map<String, dynamic> message) async {
    if (!_isRunning) {
      print('BLE Gateway не запущен');
      return;
    }

    try {
      final jsonData = json.encode(message);

      if (_characteristic != null) {
        await _characteristic!.notify(jsonData);
        print('BLE сообщение отправлено: $jsonData');
      } else {
        print('BLE недоступен, сообщение: $jsonData');
      }
    } catch (e) {
      print('Ошибка отправки BLE сообщения: $e');
    }
  }

  /// Создание GATT приложения
  Future<void> _createGattApplication() async {
    _application = _GattApplication();
    _service = _GattService(serviceUuid);
    _characteristic =
        _GattCharacteristic(characteristicUuid, _onMessageReceived);

    _service!.addCharacteristic(_characteristic!);
    _application!.addService(_service!);

    await _bus!.registerObject(_application!);
    await _bus!.registerObject(_service!);
    await _bus!.registerObject(_characteristic!);
  }

  /// Регистрация приложения в BlueZ
  Future<void> _registerApplication() async {
    if (_client == null || _client!.adapters.isEmpty) return;

    final adapterPath = '/org/bluez/hci0'; // Обычно первый адаптер

    // Прямой вызов D-Bus метода для регистрации GATT приложения
    await _bus!.callMethod(
      destination: 'org.bluez',
      path: DBusObjectPath(adapterPath),
      interface: 'org.bluez.GattManager1',
      name: 'RegisterApplication',
      values: [_application!.path, DBusDict.stringVariant({})],
    );
  }

  /// Отмена регистрации приложения
  Future<void> _unregisterApplication() async {
    if (_client == null || _client!.adapters.isEmpty) return;

    final adapterPath = '/org/bluez/hci0';

    try {
      await _bus!.callMethod(
        destination: 'org.bluez',
        path: DBusObjectPath(adapterPath),
        interface: 'org.bluez.GattManager1',
        name: 'UnregisterApplication',
        values: [_application!.path],
      );
    } catch (e) {
      print('Ошибка отмены регистрации: $e');
    }
  }

  /// Запуск рекламы BLE устройства
  Future<void> _startAdvertising() async {
    if (_client == null || _client!.adapters.isEmpty) return;

    try {
      final adapterPath = '/org/bluez/hci0';

      // Создаем объект рекламы
      final advPath = DBusObjectPath('/org/example/SmartHub/advertisement0');
      _advertisement = _Advertisement(advPath, serviceUuid);
      await _bus!.registerObject(_advertisement!);

      // Регистрируем рекламу
      await _bus!.callMethod(
        destination: 'org.bluez',
        path: DBusObjectPath(adapterPath),
        interface: 'org.bluez.LEAdvertisingManager1',
        name: 'RegisterAdvertisement',
        values: [advPath, DBusDict.stringVariant({})],
      );

      print('BLE реклама запущена');
    } catch (e) {
      print('Ошибка запуска рекламы: $e');
    }
  }

  /// Остановка рекламы BLE устройства
  Future<void> _stopAdvertising() async {
    if (_advertisement == null) return;

    try {
      final adapterPath = '/org/bluez/hci0';

      await _bus!.callMethod(
        destination: 'org.bluez',
        path: DBusObjectPath(adapterPath),
        interface: 'org.bluez.LEAdvertisingManager1',
        name: 'UnregisterAdvertisement',
        values: [_advertisement!.path],
      );
    } catch (e) {
      print('Ошибка остановки рекламы: $e');
    }
  }

  /// Обработчик полученных сообщений
  void _onMessageReceived(String jsonData) {
    try {
      final message = json.decode(jsonData) as Map<String, dynamic>;
      print('Получено BLE сообщение: $jsonData');

      // Вызываем обработчик, если он установлен
      onMessage?.call(message);

      _messageController?.add(message);
    } catch (e) {
      print('Ошибка обработки BLE сообщения: $e');
    }
  }

  /// Настройка обнаружимости Bluetooth устройства
  Future<void> _setBluetoothDiscoverable(bool enable) async {
    try {
      if (!Platform.isLinux) {
        print('Настройка Bluetooth обнаружимости доступна только на Linux');
        return;
      }

      if (enable) {
        // Включаем обнаружимость с неограниченным временем
        await Process.run('bluetoothctl', ['discoverable', 'on']);
        await Process.run('bluetoothctl', ['discoverable-timeout', '0']);
        print('Bluetooth обнаружимость включена');
      } else {
        // Отключаем обнаружимость
        await Process.run('bluetoothctl', ['discoverable', 'off']);
        print('Bluetooth обнаружимость отключена');
      }
    } catch (e) {
      print('Ошибка настройки Bluetooth обнаружимости: $e');
    }
  }

  /// Проверка доступности BLE
  bool get isAvailable => _client != null;

  /// Статус работы
  bool get isRunning => _isRunning;
}

/// GATT Application D-Bus объект
class _GattApplication extends DBusObject {
  final List<_GattService> _services = [];

  _GattApplication()
      : super(DBusObjectPath('/org/example/SmartHub/app'),
            isObjectManager: true);

  void addService(_GattService service) {
    _services.add(service);
  }

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall methodCall) async {
    if (methodCall.interface == 'org.freedesktop.DBus.ObjectManager') {
      if (methodCall.name == 'GetManagedObjects') {
        final objects = <DBusObjectPath, Map<String, Map<String, DBusValue>>>{};
        for (final service in _services) {
          objects[service.path] = service.interfacesAndProperties;
          for (final char in service._characteristics) {
            objects[char.path] = char.interfacesAndProperties;
          }
        }
        final managedObjects = <DBusValue, DBusValue>{};
        for (final entry in objects.entries) {
          managedObjects[entry.key] = DBusDict.stringVariant(entry.value
              .map((k, v) => MapEntry(k, DBusDict.stringVariant(v))));
        }
        return DBusMethodSuccessResponse([
          DBusDict(
              DBusSignature('o'), DBusSignature('a{sa{sv}}'), managedObjects)
        ]);
      }
    }
    return DBusMethodErrorResponse.unknownMethod();
  }
}

/// GATT Service D-Bus объект
class _GattService extends DBusObject {
  final String uuid;
  final List<_GattCharacteristic> _characteristics = [];

  _GattService(this.uuid)
      : super(DBusObjectPath('/org/example/SmartHub/service0'));

  void addCharacteristic(_GattCharacteristic characteristic) {
    _characteristics.add(characteristic);
  }

  @override
  Map<String, Map<String, DBusValue>> get interfacesAndProperties => {
        'org.bluez.GattService1': {
          'UUID': DBusString(uuid),
          'Primary': DBusBoolean(true),
        }
      };
}

/// GATT Characteristic D-Bus объект
/// GATT Characteristic D-Bus объект для write-without-response
class _GattCharacteristic extends DBusObject {
  final String uuid;
  final Function(String) onWrite;
  List<int> _value = [];

  // Список подписанных клиентов для notify
  bool _notifying = false;

  _GattCharacteristic(this.uuid, this.onWrite)
      : super(DBusObjectPath('/org/example/SmartHub/service0/char0'));

  @override
  Map<String, Map<String, DBusValue>> get interfacesAndProperties => {
        'org.bluez.GattCharacteristic1': {
          'UUID': DBusString(uuid),
          'Service': DBusObjectPath('/org/example/SmartHub/service0'),
          'Flags':
              DBusArray.string(['read', 'write-without-response', 'notify']),
          'Value': DBusArray.byte(_value),
        }
      };

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall methodCall) async {
    if (methodCall.interface == 'org.bluez.GattCharacteristic1') {
      switch (methodCall.name) {
        case 'ReadValue':
          return DBusMethodSuccessResponse([DBusArray.byte(_value)]);
        case 'WriteValue':
          try {
            final data = methodCall.values[0].asByteArray().toList();
            _value = data;
            final jsonData = utf8.decode(data);
            onWrite(jsonData); // вызываем обработчик
          } catch (e) {
            print('Invalid JSON or write error: $e');
          }
          return DBusMethodSuccessResponse();
        case 'StartNotify':
          // Зарегистрировать подписчика
          _notifying = true;
          return DBusMethodSuccessResponse();
        case 'StopNotify':
          _notifying = false;
          return DBusMethodSuccessResponse();
      }
    }
    return DBusMethodErrorResponse.unknownMethod();
  }

  Future<void> notify(String jsonData) async {
    _value = utf8.encode(jsonData);
    if (_notifying) {
      await emitPropertiesChanged(
        'org.bluez.GattCharacteristic1',
        changedProperties: {'Value': DBusArray.byte(_value)},
      );
    }
  }
}

/// Advertisement D-Bus объект
class _Advertisement extends DBusObject {
  final String serviceUuid;

  _Advertisement(super.path, this.serviceUuid);

  @override
  Map<String, Map<String, DBusValue>> get interfacesAndProperties => {
        'org.bluez.LEAdvertisement1': {
          'Type': DBusString('peripheral'),
          'ServiceUUIDs': DBusArray.string([serviceUuid]),
          'LocalName': DBusString('SmartHub'),
          'IncludeTxPower': DBusBoolean(true),
          'Appearance': DBusInt16(0x0040), // optional: phone/desktop icon
          'Includes': DBusArray.string(['tx-power', 'local-name']),
        }
      };

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall methodCall) async {
    if (methodCall.interface == 'org.bluez.LEAdvertisement1') {
      if (methodCall.name == 'Release') {
        print('Advertisement released');
        return DBusMethodSuccessResponse();
      }
    }
    return DBusMethodErrorResponse.unknownMethod();
  }
}

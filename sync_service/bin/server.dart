import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:common/common.dart';
import 'package:devices/devices.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart' show Dio, BaseOptions;
import 'package:events/events.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_proxy/shelf_proxy.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:sync_service/ble_server.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

String? getENV(String key) =>
    Platform.environment[key] ??
    switch (String.fromEnvironment(key)) {
      '' => null,
      String v => v,
    };

final String remoteServerUrl = getENV('REMOTE_SERVER_URL')!;
final String configDataPath = getENV('CONFIG_DATA_PATH') ?? '/app/config_data';

final String? portT = getENV('PORTT');

// Configure routes.
final _router = Router()
  ..get('/ws', webSocketProxyHandler)
  ..all('/<path|.*>', proxyHandler(remoteServerUrl));

Completer<GetIt> locatorCompleter = Completer<GetIt>();

// Хранилище всех активных локальных WebSocket соединений
final Set<WebSocketChannel> activeWebSockets = {};

String? wifiSsid;
String? wifiPass;
String? gAuthToken;
int? gDeviceId;
int? gProjectId;
BleGateway? bleGateway;

Future<void> main() async {
  print("Dart SmartHub сервис запущен");

  // Если уже есть сохранённый токен — сразу запускаем WS
  final tokenFile = File("$configDataPath/config.json");
  print(await tokenFile.exists());
  if (await tokenFile.exists()) {
    final cfg = json.decode(await tokenFile.readAsString());
    gAuthToken = cfg['authToken'];
    gDeviceId = cfg['deviceId'];
    gProjectId = cfg['projectId'];
    if (gAuthToken != null || gDeviceId != null) {
      start();
    }
  }

  // ButtonResetService resetService = ButtonResetService();

  // // Запускаем сервис кнопки в фоновом режиме
  // resetService.start().catchError((e) {
  //   print("Ошибка запуска сервиса кнопки сброса: ${e.toString()}");
  // });

  // // Этот print выполнится сразу, не дожидаясь завершения start()
  // print("Сервис кнопки сброса запускается в фоновом режиме...");

  // resetService.onResetPressed.listen((_) async {
  //   print(
  //       "Кнопка сброса удерживалась 5 секунд, выполняем сброс конфигурации...");

  //   // Удаляем сохранённый токен
  //   final tokenFile = File("/app/config_data/config.json");
  //   if (await tokenFile.exists()) {
  //     await tokenFile.delete();
  //     print("Удалён файл с токеном");
  //   } else {
  //     print("Файл с токеном не найден");
  //   }

  //   // Сброс переменных
  //   gAuthToken = null;
  //   gDeviceId = null;
  //   gProjectId = null;

  //   // Останавливаем BLE Gateway, если запущен
  //   if (bleGateway != null) {
  //     print("Останавливаем BLE Gateway...");
  //     bleGateway!.stop();
  //     bleGateway = null;
  //   }

  //   print("Перезагрузка сервиса для повторной настройки...");
  //   exit(0);
  // });

  if (gAuthToken == null || gDeviceId == null) {
    // Запускаем Python BLE Gateway
    await startBleGateway();
  }

  // Обработка завершения работы
  ProcessSignal.sigint.watch().listen((signal) {
    print("Получен сигнал завершения, останавливаем сервисы...");
    cleanup();
    exit(0);
  });

  ProcessSignal.sigterm.watch().listen((signal) {
    print("Получен SIGTERM, останавливаем сервисы...");
    cleanup();
    exit(0);
  });
}

void cleanup() {
  if (bleGateway != null) {
    print("Останавливаем BLE Gateway...");
    bleGateway!.stop();
    bleGateway = null;
  }
}

Future<void> startBleGateway() async {
  try {
    print("Запускаем BLE Gateway...");

    bleGateway = BleGateway();

    // Устанавливаем обработчик сообщений
    bleGateway!.onMessage = handleMessage;

    // Запускаем BLE Gateway
    await bleGateway!.start();

    print("BLE Gateway запущен успешно");
  } catch (e) {
    print("Ошибка запуска BLE Gateway: $e");
    // Перезапускаем через 10 секунд при ошибке
    Timer(Duration(seconds: 10), () {
      print("Повторная попытка запуска BLE Gateway...");
      startBleGateway();
    });
  }
}

Future<String> connectToWiFi(String ssid, String pass) async {
  try {
    // Пример команды для подключения к WiFi через nmcli
    final result = await Process.run('nmcli', [
      'dev',
      'wifi',
      'connect',
      ssid,
      'password',
      pass,
    ]);

    if (result.exitCode == 0) {
      print("Успешно подключились к WiFi: $ssid");
      return getLocalIpAddress();
    } else {
      throw Exception("Ошибка подключения к WiFi: ${result.stderr}");
    }
  } catch (e) {
    throw Exception("Ошибка подключения к WiFi: $e");
  }
}

Future<String> getLocalIpAddress() async {
  try {
    final result = await Process.run('hostname', ['-I']);
    if (result.exitCode == 0) {
      final ip = (result.stdout as String).split(' ').first;
      print("Локальный IP адрес: $ip");
      return ip;
    } else {
      print("Ошибка получения IP адреса: ${result.stderr}");
      throw Exception("Ошибка получения IP адреса: ${result.stderr}");
    }
  } catch (e) {
    throw Exception("Ошибка получения IP адреса: $e");
  }
}

void handleMessage(Map<String, dynamic> msg) async {
  switch (msg['cmd']) {
    case 'wifi':
      try {
        wifiSsid = msg['ssid'];
        wifiPass = msg['pass'];
        print("📡 Получил WiFi: $wifiSsid / $wifiPass");
        final ip = await connectToWiFi(wifiSsid!, wifiPass!);
        sendBle({
          "status": "wifi_ok",
          "device_ip": ip,
          "device_version": "1.0.0",
          "device_type": "smart_hub",
        });
      } catch (e) {
        print("Ошибка при подключении к WiFi: $e");
        sendBle({
          "status": "wifi_fail",
          "error": e.toString(),
        });
      }
      break;

    case 'auth_token':
      gAuthToken = msg['value'];
      gDeviceId = msg['device_id'];
      gProjectId = msg['project_id']; // Получаем project_id из сообщения
      await File("$configDataPath/config.json").writeAsString(json.encode({
        "authToken": gAuthToken,
        "deviceId": gDeviceId,
        "projectId": gProjectId
      }));
      print("🔑 Сохранил токен: $gAuthToken, projectId: $gProjectId");
      sendBle({"status": "token_saved"});
      bleGateway!.stop();
      start();
      break;

    default:
      print("Неизвестная команда: $msg");
  }
}

void sendBle(Map<String, dynamic> msg) {
  if (bleGateway != null) {
    try {
      // Отправляем сообщение через BLE Gateway
      bleGateway!.sendMessage(msg);
    } catch (e) {
      print("Ошибка отправки BLE сообщения: $e");
    }
  } else {
    print("BLE Gateway не запущен, сообщение: ${json.encode(msg)}");
  }
}

void start() async {
  final locator = await initModules();
  locatorCompleter.complete(locator);

  _heartbeatDevice(locator, gDeviceId!);

  _serve({
    'authToken': gAuthToken,
    'projectId': gProjectId,
  });

  final eventsController = locator.get<IEventsRepository>();

  eventsController.onData.listen((message) {
    _broadcastToAllWebSockets(message);
  });

  // final cpuCount = math.max(Platform.numberOfProcessors, 4);
  // print('CPU count: $cpuCount');

  // for (var i = 0; i < cpuCount; i++) {
  //   ReceivePort receivePort = ReceivePort();
  //   await Isolate.spawn(
  //     _serve,
  //     {
  //       'sendPort': receivePort.sendPort,
  //       'authToken': gAuthToken,
  //       'projectId': gProjectId,
  //     },
  //     debugName: 'Server #$i',
  //   );
  // }
}

Future<void> _serve(Map<String, dynamic> args) async {
  final locator = await locatorCompleter.future;
  final devicesController = IDevicesController.create(
    repository: locator.get(),
    projectId: gProjectId!,
  );

  locator.registerSingleton(devicesController);

  fetchDevices(devicesController: devicesController);

  // final sendPort = args['sendPort'] as SendPort;
  final authToken = args['authToken'] as String?;
  final projectId = args['projectId'] as int?;
  gAuthToken = authToken;

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(portT ?? '8080');

  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.

  final handler = Pipeline()
      .addMiddleware(logRequests(
        logger: (message, isError) =>
            _logger('${Isolate.current.debugName} $message', isError),
      ))
      // add project ID replacement middleware
      .addMiddleware(
        (innerHandler) => (request) async {
          var uri = request.requestedUri;

          // Заменяем -1 на projectId в путях /api/projects/-1/***
          if (projectId != null && uri.path.startsWith('/api/projects/-1/')) {
            final newPath = uri.path
                .replaceFirst('/api/projects/-1/', '/api/projects/$projectId/');

            final newRequest = Request(
              request.method,
              uri.replace(path: newPath),
              headers: request.headers,
              body: request.read(),
              context: request.context,
            );
            return await innerHandler(newRequest);
          }

          return await innerHandler(request);
        },
      )
      // add Authication
      .addMiddleware(
        (innerHandler) => (request) async {
          final newRequest = request.change(
            headers: {
              ...request.headers,
              if (request.headers['Authorization'] == null)
                'Authorization': 'Bearer $authToken',
            },
          );
          final response = await innerHandler(newRequest);
          return response;
        },
      )
      .addMiddleware(
        (innerHandler) => (request) async {
          try {
            return await innerHandler(request);
          } on HijackException {
            rethrow;
          } catch (e) {
            return Response.internalServerError(
                body: 'Internal server error: $e');
          }
        },
      )
      .addMiddleware(
        (innerHandler) => (request) async {
          final newRequest = request.change(
            context: {
              ...request.context,
              'locator': locator,
              'isolateName': Isolate.current.debugName,
            },
          );
          final response = await innerHandler(newRequest);
          return response;
        },
      )
      .addHandler(_router.call);

  final server = await serve(
    handler,
    ip,
    port,
    shared: true,
  );
  print('${Isolate.current.debugName} listening on port ${server.port}');
}

Future<GetIt> initModules() async {
  final locator = GetIt();

  final dio = Dio(
    BaseOptions(
      baseUrl: '$remoteServerUrl/api/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-App-Client': 'voice-assistant-service',
        // auth
        'Authorization': 'Bearer $gAuthToken',
      },
    ),
  );
  locator.registerSingleton(dio);

  await EventsModule.init(
    locator: locator,
    wsUrl: remoteServerUrl,
    authToken: gAuthToken,
  );
  await DevicesModule.init(locator: locator);

  return locator;
}

void _logger(String msg, bool isError) {
  if (isError) {
    print('[ERROR] $msg');
  } else {
    print(msg);
  }
}

/// Отправляет сообщение всем подключенным локальным WebSocket соединениям
void _broadcastToAllWebSockets(dynamic message) {
  final deadConnections = <WebSocketChannel>[];

  _logger('Broadcast message to WebSocket: $message', false);
  for (final ws in activeWebSockets) {
    try {
      ws.sink.add(message);
    } catch (e) {
      _logger('Error broadcasting to WebSocket: $e', true);
      deadConnections.add(ws);
    }
  }

  // Удаляем неработающие соединения
  for (final ws in deadConnections) {
    activeWebSockets.remove(ws);
  }

  print(
      'Broadcast sent to ${activeWebSockets.length - deadConnections.length} WebSockets');
}

// ...existing code...

Future<Response> webSocketProxyHandler(Request request) async {
  final locator = await locatorCompleter.future;
  final eventsController = locator.get<IEventsRepository>();
  return webSocketHandler(
    (WebSocketChannel webSocket) async {
      StreamSubscription? localSubscription;

      try {
        // Регистрируем локальное соединение
        activeWebSockets.add(webSocket);
        print(
            'Local WebSocket connected. Active connections: ${activeWebSockets.length}');

        // Проксируем сообщения от локального клиента
        localSubscription = webSocket.stream.listen(
          (message) async {
            if (message is String && message == 'ping') {
              // Игнорируем ping-сообщения
              return;
            }
            _logger('Received local message: $message', false);
            try {
              // Обрабатываем специальные локальные сообщения
              if (message is String &&
                  message.contains('needDeviceCapabilitiesChange')) {
                final messageJson = json.decode(message) as List;
                if (await isLocalDeviceChange(messageJson.first['deviceId'])) {
                  print('Local device change detected, broadcasting...');
                  _broadcastToAllWebSockets(message);
                  return;
                }
                print('Device change is not local, sending to server instead.');
              }
            } catch (e) {
              _logger('Error processing local message: $e', true);
            }
            eventsController.sinkAdd(message);
          },
          onError: (error) {
            _logger('Local WebSocket error: $error', true);
          },
          onDone: () {
            _logger('Local WebSocket closed', false);
          },
        );

        // Ждем закрытия локального соединения
        await webSocket.sink.done;
      } catch (e) {
        _logger('WebSocket handler error: $e', true);
      } finally {
        // Очищаем ресурсы
        await localSubscription?.cancel();

        // Удаляем соединение из активных
        activeWebSockets.remove(webSocket);
        print(
            'Local WebSocket disconnected. Active connections: ${activeWebSockets.length}');

        try {
          webSocket.sink.close();
        } catch (e) {
          // Уже закрыт
        }
      }
    },
  )(request);
}

void pingWebSocket(WebSocket webSocket) {
  Timer.periodic(Duration(seconds: 5), (timer) {
    try {
      if (webSocket.readyState == WebSocket.open &&
          webSocket.closeCode == null) {
        webSocket.add('ping');
      } else {
        timer.cancel();
      }
    } catch (e) {
      if (e.toString().contains('StreamSink is closed')) {
        timer.cancel();
      }
      rethrow;
    }
  });
}

Future<bool> isLocalDeviceChange(int deviceId) async {
  final locator = await locatorCompleter.future;
  final devicesController = locator.get<IDevicesController>();

  try {
    final device = devicesController.state.data?.firstWhere(
      (d) => d.id == deviceId,
    );
    if (device != null) {
      return [
        DeviceProviderType.hikvision,
        DeviceProviderType.hardware,
        DeviceProviderType.logoSiemens
      ].contains(device.providerType);
    } else {
      print("Device with ID $deviceId not found");
      return false;
    }
  } catch (e) {
    print("Error checking device $deviceId offline status: $e");
    return false;
  }
}

void _heartbeatDevice(GetIt locator, int deviceId) async {
  final eventsController = locator.get<IEventsRepository>();
  await Future.delayed(Duration(seconds: 5));
  try {
    await eventsController.sendMessages(messages: [
      EventMessageInputEntity.onDeviceHeartbeat(
        deviceId: deviceId,
      )
    ]);
  } catch (e) {
    print("Ошибка отправки heartbeat: $e");
  }
  Timer.periodic(Duration(seconds: 10), (_) async {
    try {
      await eventsController.sendMessages(messages: [
        EventMessageInputEntity.onDeviceHeartbeat(
          deviceId: deviceId,
        )
      ]);
    } catch (e) {
      print("Ошибка при подготовке heartbeat: $e");
    }
  });
  return;
}

void fetchDevices({required IDevicesController devicesController}) {
  devicesController.fetch();

  devicesController.stateChanged.listen((state) {
    state.mapOrNull(
      failure: (state) async {
        await Future.delayed(Duration(seconds: 5));
        devicesController.fetch();
      },
      success: (state) {
        print('Devices fetched: ${state.data.length}');
      },
    );
  });
}

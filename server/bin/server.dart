import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;

import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:database/database.dart';
import 'package:device_positions/device_positions.dart';
import 'package:device_scenario/device_scenario.dart';
import 'package:devices/devices.dart';
import 'package:email_verification/email_verification.dart';
import 'package:events/events.dart';
import 'package:floors/floors.dart';
import 'package:inout_scenario/inout_scenario.dart';
import 'package:oauth/oauth.dart';
import 'package:projects/projects.dart';
import 'package:refresh_token/refresh_token.dart';
import 'package:rooms/rooms.dart';
import 'package:server/server.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smtp/smtp.dart';
import 'package:users/users.dart';
import 'package:web_socket_core/web_socket_core.dart';
import 'package:yandex_auth/yandex_auth.dart';
import 'package:yandex_devices/yandex_devices.dart';
import 'package:yandex_dialogs/yandex_dialogs.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..get('/api/swagger', _swaggerHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Future<Response> _swaggerHandler(Request request) async {
  final html = await buildSwaggerHtml();
  return Response.ok(html, headers: {'Content-Type': 'text/html'});
}

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Origin, Content-Type',
};

void main(List<String> args) async {
  final locator = await initModules();

  final cpuCount = math.max(Platform.numberOfProcessors, 4);
  print('CPU count: $cpuCount');

  for (var i = 0; i < cpuCount; i++) {
    await Isolate.spawn(
      _serve,
      WebSocketIsolatesService.instance.getNewSendPort(),
      debugName: 'Server #$i',
    );
  }
  final updateOfflineDevicesService =
      UpdateOfflineDevicesService(locator: locator);
  updateOfflineDevicesService.start();
}

Future<void> _serve(SendPort sendPort) async {
  final secretKey = ENV.fromKey('JWT_SECRET_KEY');

  final locator = await initModules();

  // For running in containers, we respect the PORT environment variable.
  final port = ENV.fromKeyInt('PORT');

  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.

  final handler = Pipeline()
      .addMiddleware(logRequests(
        logger: (message, isError) =>
            _logger('${Isolate.current.debugName} $message', isError),
      ))
      .addMiddleware(
        (innerHandler) => (request) async {
          final response = await innerHandler(request);
          return response.change(
            headers: {
              ...response.headers,
              ...corsHeaders,
            },
          );
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
      .addMiddleware(authMiddleware(
        secretKey,
        publicPaths: [
          'api/tokens/login',
          'api/swagger',
          'api/tokens/refresh',
          'oauth/login',
          'oauth/login/submit',
          'oauth/token',
        ],
      ))
      .addMiddleware(checkProjectMiddleware())
      .addHandler(_router.call);

  final server = await serve(
    handler,
    ip,
    port,
    shared: true,
  );
  print('${Isolate.current.debugName} listening on port ${server.port}');

  WebSocketIsolatesService.instance.startInIsolate(sendPort, locator.get());
}

Future<GetIt> initModules() async {
  final locator = GetIt();

  final DatabaseService database = MyDatabaseService(locator: locator);
  locator.registerSingleton(database);

  await Future.wait([
    ProjectsModule.init(
      locator: locator,
      router: _router,
    ),
    RefreshTokenModule.init(
      locator: locator,
      router: _router,
    ),
    AuthTokenModule.init(
      locator: locator,
      router: _router,
    ),
    UsersModule.init(
      locator: locator,
      router: _router,
    ),
    DevicesModule.init(
      locator: locator,
      router: _router,
    ),
    RoomsModule.init(
      locator: locator,
      router: _router,
    ),
    EventsModule.init(
      locator: locator,
      router: _router,
    ),
    WebSocketCoreModule.init(
      locator: locator,
      router: _router,
    ),
    FloorsModule.init(
      locator: locator,
      router: _router,
    ),
    InOutScenarioModule.init(
      locator: locator,
      router: _router,
    ),
    DeviceScenarioModule.init(
      locator: locator,
      router: _router,
    ),
    OAuthModule.init(
      locator: locator,
      router: _router,
    ),
    YandexAuthModule.init(
      locator: locator,
      router: _router,
    ),
    YandexDialogsModule.init(
      locator: locator,
      router: _router,
      skillId: ENV.fromKey('YANDEX_DIALOGS_SKILL_ID'),
      oauthToken: ENV.fromKey('YANDEX_DIALOGS_OAUTH_TOKEN'),
    ),
    YandexDevicesModule.init(
      locator: locator,
      router: _router,
    ),
    DevicePositionsModule.init(
      locator: locator,
      router: _router,
    ),
    SmtpModule.init(
      locator: locator,
      router: _router,
    ),
    EmailVerificationModule.init(
      locator: locator,
      router: _router,
    ),
  ]);

  await database.init();

  return locator;
}

void _logger(String msg, bool isError) {
  if (isError) {
    print('[ERROR] $msg');
  } else {
    print(msg);
  }
}

import 'package:app_info/app_info.dart';
import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:device_positions/device_positions.dart';
import 'package:device_scenarios/device_scenarios.dart';
import 'package:devices/devices.dart';
import 'package:dio/dio.dart';
import 'package:events/events.dart';
import 'package:floors/floors.dart';
import 'package:hikvision_isapi/hikvision_isapi.dart';
import 'package:inout_scenarios/inout_scenarios.dart';
import 'package:localization/localization.dart';
import 'package:media_kit/media_kit.dart';
import 'package:projects/projects.dart';
import 'package:rooms/rooms.dart';
import 'package:users/users.dart';
import 'package:wifi_devices/wifi_devices.dart';
import 'package:yandex_auth/yandex_auth.dart';
import 'package:zigbee_devices/zigbee_devices.dart';

class AppRunner implements IAppRunner {
  const AppRunner({
    required this.locator,
    required this.appConfig,
  });

  @override
  final GetIt locator;

  final IAppConfig appConfig;

  @override
  Future<void> preloadData({bool isBackgroundService = false}) async {
    if (!isBackgroundService) {
      WidgetsFlutterBinding.ensureInitialized();
      MediaKit.ensureInitialized();

      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.im);
      // SystemChrome.setPreferredOrientations([
      //   DeviceOrientation.landscapeRight,
      //   DeviceOrientation.landscapeLeft,
      // ]);

      Bloc.observer = AppBlocObserver();
      Bloc.transformer = sequential();
    }

    locator.registerSingleton<IAppConfig>(appConfig);

    final dio = Dio(
      BaseOptions(
        baseUrl: appConfig.apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-App-Client': 'FlutterApp',
        },
      ),
    )..interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          logPrint: print,
        ),
      );

    dio.transformer = DioTransformer();
    locator.registerSingleton(dio);

    // final database = LocalDatabase();
    // locator.registerSingleton(database);
    locator.registerSingleton(dio);

    await AppInfoModule.init(locator: locator);
    await Future.wait([
      AuthTokenModule.init(locator: locator),
      LocalizationModule.init(locator: locator),
      DevicesModule.init(locator: locator),
      EventsModule.init(locator: locator),
      RoomsModule.init(locator: locator),
      FloorsModule.init(locator: locator),
      InOutScenariosModule.init(locator: locator),
      DeviceScenariosModule.init(locator: locator),
      YandexAuthModule.init(locator: locator),
      UsersModule.init(locator: locator),
      ZigbeeDevicesModule.init(locator: locator),
      WifiDevicesModule.init(locator: locator),
      DevicePositionsModule.init(locator: locator),
      ProjectsModule.init(locator: locator),
      HikvisionISAPIModule.init(
        locator: locator,
      ),
    ]);
  }

  @override
  Future<void> run(IAppBuilder appBuilder) async {
    await preloadData();
    runApp(
      LocatorScope(
        create: (context) => locator,
        child: appBuilder.buildApp(),
      ),
    );
  }
}

class DioTransformer extends SyncTransformer {
  DioTransformer() : super(jsonDecodeCallback: _jsonDecodeCallback);

  static _jsonDecodeCallback(String responseText) async {
    final data = await DioJsonTransformer.jsonDecodeCallbackFunc(responseText);
    return data;
  }
}

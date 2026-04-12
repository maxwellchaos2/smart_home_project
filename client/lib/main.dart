import 'dart:async';
import 'dart:developer';

import 'package:auth/auth.dart';
import 'package:common/common.dart';
import 'package:device_scenarios/device_scenarios.dart';
import 'package:devices/devices.dart';
import 'package:inout_scenarios/inout_scenarios.dart';
import 'package:rooms/rooms.dart';
import 'package:wifi_devices/wifi_devices.dart';
import 'package:yandex_auth/yandex_auth.dart';
import 'package:zigbee_devices/zigbee_devices.dart';

import 'src/app_builder.dart';
import 'src/app_config.dart';
import 'src/main_app_runner.dart';
import 'src/screens/screens.dart';

void main() async {
  // debugRepaintRainbowEnabled = true;
  runZonedGuarded(() {
    final appConfig = switch (const String.fromEnvironment('ENV')) {
      'dev' => DevAppConfig(),
      _ => ProdAppConfig(),
    };
    final runner = AppRunner(locator: GetIt(), appConfig: appConfig);
    final builder = AppBuilder(
      appConfig: appConfig,
      navigatorController: getNavigatorController(),
    );

    runner.run(builder);
  }, ((error, stack) {
    log(error.toString(), stackTrace: stack);
  }));
}

AppNavigatorController getNavigatorController() {
  return AppNavigatorController(
    initialPages: [
      const SplashScreen().page,
    ],
  )
    ..registerRoute(
      '/main',
      () => const MainScreen().page,
    )
    ..registerRoute(
      '/splash',
      () => const SplashScreen().page,
    )
    ..registerRoute(
      '/sign_in',
      () => const SignInScreen().page,
    )
    ..registerRoute(
      '/rooms',
      () => const RoomsScreen().page,
    )
    ..registerRoute(
      '/inout_scenarios',
      () => const InOutScenariosScreen().page,
    )
    ..registerRoute(
      '/device_scenarios',
      () => const DeviceScenariosScreen().page,
    )
    ..registerRoute(
      '/controller_devices',
      () => const ControllerDevicesScreen().page,
    )
    ..registerRoute(
      '/add_controller_device',
      () => const ControllerDeviceEditScreen().page,
    )
    ..registerRoute(
      '/add_yandex_devices',
      () => const AddYandexDevicesScreen().page,
    )
    ..registerRoute(
      '/add_zigbee_devices',
      () => const AddZigbeeDevicesScreen().page,
    )
    ..registerRoute(
      '/add_wifi_devices',
      () => const AddWifiDevicesScreen().page,
    );
}

// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:app_info/app_info.dart';
import 'package:auth/auth.dart';
import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:device_positions/device_positions.dart';
import 'package:device_scenarios/device_scenarios.dart';
import 'package:devices/devices.dart';
import 'package:floors/floors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/projects.dart';
import 'package:rooms/rooms.dart';
import 'package:users/users.dart';

final class SplashScreen extends StatefulWidget with ScreenMixin {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;
  late final Completer<AuthTokenEntity?> _tokenReceivedCompleter;
  late final Completer _appInfoReceivedCompleter;
  late final Completer _devicesReceivedCompleter;
  late final Completer _deviceScenariosReceivedCompleter;
  late final Completer _roomsReceivedCompleter;
  late final Completer _floorsReceivedCompleter;
  late final Completer _userReceivedCompleter;
  late final Completer _projectReceivedCompleter;

  bool _showLogo = false;
  @override
  void initState() {
    super.initState();
    _receiveToken();
    _receiveAppInfo();
    _timer = Timer(const Duration(seconds: 1, milliseconds: 200), goNext);
    Future.delayed(
      Duration.zero,
      () => setState(
        () {
          _showLogo = true;
        },
      ),
    );
  }

  void _receiveToken() {
    _tokenReceivedCompleter = Completer();
    if (AuthTokenScope.of(context).state.data != null) {
      _tokenReceivedCompleter.complete(AuthTokenScope.of(context).state.data);
    } else {
      AuthTokenScope.of(context).fetch();
    }
  }

  void _receiveAppInfo() {
    _appInfoReceivedCompleter = Completer();
    if (AppInfoScope.of(context).state.data != null) {
      _appInfoReceivedCompleter.complete();
    } else {
      AppInfoScope.of(context).fetch();
    }
  }

  void _receiveDevices() {
    _devicesReceivedCompleter = Completer();
    // if (DevicesScope.of(context).state.data != null) {
    //   _devicesReceivedCompleter.complete();
    // } else {
    DevicesScope.of(context).fetch();
    // }
  }

  void _receiveDevicesScenarios() {
    _deviceScenariosReceivedCompleter = Completer();
    DeviceScenariosScope.of(context).fetch();
  }

  void _receiveRooms() {
    _roomsReceivedCompleter = Completer();
    // if (RoomsScope.of(context).state.data != null) {
    //   _roomsReceivedCompleter.complete();
    // } else {
    RoomsScope.of(context).fetch();
    // }
  }

  void _precacheSelectedPlans() async {
    final apiUri = Uri.parse(context.locator.get<IAppConfig>().apiUrl);
    final floors = FloorsScope.of(context, listen: false).state.data;
    if (floors == null) return;
    final rooms = RoomsScope.of(context, listen: false).state.data;

    for (final floor in floors.where((f) => f.planMediaPath != null)) {
      final url = apiUri.replace(path: floor.planMediaPath).toString();

      final loader = SvgNetworkLoader(
        url,
      );
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }

    if (rooms == null) return;

    for (final room in rooms.where((r) => r.planMediaPath != null)) {
      final url = apiUri.replace(path: room.planMediaPath!).toString();

      final loader = SvgNetworkLoader(
        url,
      );
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }

  void _receiveFloors() {
    _floorsReceivedCompleter = Completer();
    // if (FloorsScope.of(context).state.data != null) {
    //   _floorsReceivedCompleter.complete();
    // } else {
    FloorsScope.of(context).fetch();
    // }
  }

  void _receiveUser() {
    _userReceivedCompleter = Completer();
    // if (UserScope.of(context).state.data != null) {
    //   _userReceivedCompleter.complete();
    // } else {
    UserScope.of(context).fetch();
    // }
  }

  void _receiveProject() {
    _projectReceivedCompleter = Completer();
    // if (ProjectScope.of(context).state.data != null) {
    //   _projectReceivedCompleter.complete();
    // } else {
    ProjectScope.of(context).fetch();
    // }
  }

  void goNext() async {
    final token = await _tokenReceivedCompleter.future;
    await _appInfoReceivedCompleter.future;

    if (token == null) {
      context.navigator.change(
        (pages) => [
          const SignInScreen().page,
        ],
      );
    } else {
      _receiveProject();
      await _projectReceivedCompleter.future;
      await Future.delayed(const Duration(milliseconds: 100));
      _receiveRooms();
      _receiveDevices();
      DevicePositionsScope.of(context).fetchAll();
      _receiveFloors();
      _receiveUser();
      _receiveDevicesScenarios();
      await _devicesReceivedCompleter.future;
      await _roomsReceivedCompleter.future;
      await _floorsReceivedCompleter.future;
      await _userReceivedCompleter.future;
      await _deviceScenariosReceivedCompleter.future;

      _precacheSelectedPlans();

      context.navigator.change(
        (pages) => [
          const MainScreen().page,
        ],
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectId = context.watch<ProjectIdController>().value;
    return MultiBlocListener(
      listeners: [
        AuthTokenBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) => _tokenReceivedCompleter.complete(state.data),
            success: (state) {
              if (!_tokenReceivedCompleter.isCompleted) {
                _tokenReceivedCompleter.complete(state.data);
              }
              return null;
            },
          ),
        ),
        AppInfoBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) => _appInfoReceivedCompleter.complete(),
            success: (state) {
              if (!_appInfoReceivedCompleter.isCompleted) {
                _appInfoReceivedCompleter.complete();
              }
              return null;
            },
          ),
        ),
        if (projectId != null) ...[
          DevicesBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) {
                if (!_devicesReceivedCompleter.isCompleted) {
                  _devicesReceivedCompleter.complete();
                }
                return null;
              },
            ),
          ),
          RoomsBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) {
                if (!_roomsReceivedCompleter.isCompleted) {
                  _roomsReceivedCompleter.complete();
                }
                return null;
              },
            ),
          ),
          FloorsBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) {
                if (!_floorsReceivedCompleter.isCompleted) {
                  _floorsReceivedCompleter.complete();
                }
                return null;
              },
            ),
          ),
          DeviceScenariosBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) {
                if (!_deviceScenariosReceivedCompleter.isCompleted) {
                  _deviceScenariosReceivedCompleter.complete();
                }
                return null;
              },
            ),
          )
        ],
        UserBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) =>
                context.app.showErrorDialog(message: state.failure.message),
            success: (state) {
              if (!_userReceivedCompleter.isCompleted) {
                _userReceivedCompleter.complete();
              }
              return null;
            },
          ),
        ),
        ProjectBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) =>
                context.app.showErrorDialog(message: state.failure.message),
            success: (state) {
              if (!_projectReceivedCompleter.isCompleted) {
                context.read<ProjectIdController>().value = state.data.id;
                _projectReceivedCompleter.complete();
              }
              return null;
            },
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF202020),
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: const Color(0xFF202020),
          ),
          toolbarHeight: 0,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFF202020).withOpacity(.8),
        body: SizedBox.expand(
          child: Column(
            children: [
              const Spacer(),
              AnimatedScale(
                scale: _showLogo ? 1 : .4,
                duration: const Duration(milliseconds: 400),
                child: AnimatedOpacity(
                  opacity: _showLogo ? 1 : .5,
                  duration: const Duration(milliseconds: 600),
                  child: Assets.logo.image(width: 200),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

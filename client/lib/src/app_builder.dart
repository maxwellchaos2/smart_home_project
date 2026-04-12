import 'package:app_info/app_info.dart';
import 'package:auth/auth.dart';
import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:device_positions/device_positions.dart';
import 'package:device_scenarios/device_scenarios.dart';
import 'package:devices/devices.dart';
import 'package:floors/floors.dart';
import 'package:flutter/services.dart';
import 'package:inout_scenarios/inout_scenarios.dart';
import 'package:localization/localization.dart';
import 'package:projects/projects.dart';
import 'package:rooms/rooms.dart';
import 'package:themes/themes.dart';
import 'package:users/users.dart';

final class AppBuilder implements IAppBuilder {
  final AppNavigatorController navigatorController;
  final IAppConfig appConfig;

  AppBuilder({required this.appConfig, required this.navigatorController});

  @override
  Widget buildApp() {
    return _MainApp(
      navigatorController: navigatorController,
      appConfig: appConfig,
      appTheme: AppTheme(
        lightTheme: AppTheme.defaultLightTheme.copyWith(
          iconTheme: AppTheme.defaultLightTheme.iconTheme.copyWith(
            color: Colors.black,
          ),
          extensions: [
            AppPrimaryFormButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _MainApp extends StatelessWidget {
  const _MainApp({
    required this.navigatorController,
    required this.appConfig,
    required this.appTheme,
  });

  final AppNavigatorController navigatorController;
  final IAppConfig appConfig;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return AssetsScope(
      child: MultiProvider(
        providers: [
          Provider.value(value: appConfig),
          const AuthTokenScope(),
          AuthTokenBlocListener(
            listenWhen: (previous, current) =>
                previous.isAuth && !current.isAuth,
            listener: (context, state) => state.mapOrNull(
              success: (state) => navigatorController
                  .change((_) => [const SignInScreen().page]),
            ),
          ),
          const AppInfoScope(),
          LocalizationScope(),
          UserScope(),
          ProjectScope(),
          ListenableProvider(
            create: (_) => MainScaffoldKeyController(),
            lazy: false,
          ),
          ListenableProvider(
            create: (_) => ProjectIdController(),
            lazy: false,
          ),
          DevicePositionsScope(),
        ],
        child: LocalizationBuilder(builder: (context, locale) {
          return MaterialApp(
            title: appConfig.title,
            theme: appTheme.dark,
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
            ],
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Colors.transparent,
                  systemNavigationBarColor: Colors.black,
                ),
                child: MediaQuery(
                  data: data.copyWith(textScaler: TextScaler.noScaling),
                  child: _ProjectScopesWrapper(
                    child: AppNavigator(
                      controller: navigatorController,
                      onDeepLinkOpened: (uri) {
                        // if (uri.path.contains('api/login_app?') &&
                        //     !AuthTokenScope.of(context).state.isAuth) {
                        //   navigatorController.change(
                        //     (_) => [
                        //       AuthScreen(
                        //         initToken: AuthUtis.extractLoginTokenFromUri(uri),
                        //       ).page
                        //     ],
                        //   );
                        // }
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class _ProjectScopesWrapper extends StatelessWidget {
  const _ProjectScopesWrapper({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final projectId = context.watch<ProjectIdController>().value;

    if (projectId == null) {
      // Пока projectId нет — просто возвращаем навигатор.
      return child;
    }

    return MultiProvider(
      providers: [
        DevicesScope(projectId: projectId),
        RoomsScope(projectId: projectId),
        FloorsScope(projectId: projectId),
        DeviceScenariosScope(projectId: projectId),
        InOutScenariosScope(projectId: projectId),
      ],
      child: child,
    );
  }
}

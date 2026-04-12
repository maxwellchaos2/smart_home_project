import 'package:app_info/app_info.dart';
import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Проект Умный дом',
                          style: TextStyle(fontWeight: FontWeight.bold)
                              .reverseMerge(context.textTheme.titleLarge),
                        ),
                        const SizedBox(height: 10),
                        Builder(builder: (context) {
                          final appInfo =
                              AppInfoScope.of(context, listen: true).state.data;
                          return Text(
                            'Версия ${appInfo?.package.version}',
                            style: context.textTheme.labelSmall,
                          );
                        }),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('Сценарии устройств'),
                    onTap: () {
                      context.navigator.pushRoute('/device_scenarios');
                    },
                  ),
                  ListTile(
                    title: const Text('Добавить новое устройство'),
                    onTap: () {
                      AddModalScreen().show(context);
                    },
                  ),
                  ListTile(
                    title: const Text('[PRO] Устройства контроллера'),
                    onTap: () {
                      context.navigator.pushRoute('/controller_devices');
                    },
                  ),
                  ListTile(
                    title: const Text(
                      '[PRO] Сценарии контроллера',
                    ),
                    onTap: () {
                      context.navigator.pushRoute('/inout_scenarios');
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Выйти'),
              onTap: () {
                AuthTokenScope.of(context).revoke();
              },
            ),
          ],
        ),
      ),
    );
  }
}

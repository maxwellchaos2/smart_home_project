import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:projects/projects.dart';
import 'package:yandex_auth/src/application/application.dart';

class AddYandexDevicesScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const AddYandexDevicesScreen({super.key});

  @override
  State<AddYandexDevicesScreen> createState() => _AddYandexDevicesScreenState();

  @override
  Widget wrappedScreen(BuildContext context) {
    return MultiProvider(
      providers: [
        UpdateYandexDevicesScope(
          projectId: ProjectScope.of(context).state.data!.id,
        ),
        YandexSignOutScope(),
      ],
      child: this,
    );
  }
}

class _AddYandexDevicesScreenState
    extends StateWithListeners<AddYandexDevicesScreen> {
  @override
  List<SingleChildWidget> get listeners => [
        YandexSignOutBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) =>
                context.app.showErrorDialog(message: state.failure.message),
            success: (state) {
              ProjectScope.of(context).fetch();
              DevicesScope.of(context).fetch();
              return null;
            },
          ),
        )
      ];

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Добавить устройства умного дома Яндекс',
          style: context.textTheme.titleLarge,
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  YandexSignOutScope.of(context).signOut();
                },
                child: const Text('Выйти из аккаунта'),
              ),
            ],
            icon: Icon(Icons.more_vert_sharp),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Builder(builder: (context) {
          final state =
              UpdateYandexDevicesScope.of(context, listen: true).state;
          final signOutState =
              YandexSignOutScope.of(context, listen: true).state;
          final projectState = ProjectScope.of(context, listen: true).state;
          if (projectState.data?.hasYandexAuth == false) {
            return YandexSignInButton();
          }
          return AppFormButton.primary(
            isLoading: state.isLoading ||
                signOutState.isLoading ||
                projectState.isLoading,
            onPressed: UpdateYandexDevicesScope.of(context).update,
            child: Text('Обновить список устройств'),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Builder(builder: (context) {
        return UpdateYandexDevicesBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) =>
                context.app.showErrorDialog(message: state.failure.message),
            success: (state) {
              DevicesScope.of(context).fetch();
              return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Список устройств обновлен'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
          child: Padding(
            padding: AppPaddings.horizontal,
            child: Builder(builder: (context) {
              final project = ProjectScope.of(context, listen: true).state.data;
              if (project == null) {
                return LoadingBody();
              } else if (project.hasYandexAuth) {
                final devices = DevicesScope.of(context, listen: true)
                    .state
                    .data
                    ?.where((device) =>
                        device.providerType == DeviceProviderType.yandex)
                    .toList();
                if (devices == null || devices.isEmpty) {
                  return Center(
                    child: Text(
                      'У вас нет устройств умного дома Яндекс',
                      style: context.textTheme.bodyLarge,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: devices.length + 1,
                  itemBuilder: (userContext, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 8),
                        child: Text(
                          'Добавленные устройства',
                          style: TextStyle(fontWeight: FontWeight.w600)
                              .reverseMerge(context.textTheme.bodyLarge),
                        ),
                      );
                    }
                    return Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface
                            .withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(devices[index - 1].name),
                    );
                  },
                );
              }
              return Center(
                child: Text(
                  'Войдите в аккаунт Яндекс, чтобы добавить устройства',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge,
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

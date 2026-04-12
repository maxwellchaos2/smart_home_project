import 'package:common/common.dart';
import 'package:device_scenarios/src/application/application.dart';
import 'package:device_scenarios/src/domain/domain.dart';

class DeviceScenariosScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const DeviceScenariosScreen({super.key});

  @override
  Widget wrappedScreen(BuildContext context) {
    final projectId = context.read<ProjectIdController>().value!;
    return DeviceScenarioRunScope(
      projectId: projectId,
      child: DeviceScenariosScope(
        projectId: projectId,
        child: this,
      ),
    );
  }

  @override
  State<DeviceScenariosScreen> createState() => _DeviceScenariosScreenState();
}

class _DeviceScenariosScreenState extends State<DeviceScenariosScreen> {
  @override
  void initState() {
    super.initState();
    DeviceScenariosScope.of(context).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сценарии устройств'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.navigator.push(
                DeviceScenarioScreen().page,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final state = DeviceScenariosScope.of(context, listen: true).state;
            return switch (state.data) {
              List<DeviceScenarioEntity> data when data.isNotEmpty =>
                buildBody(context, data),
              List<DeviceScenarioEntity> data when data.isEmpty =>
                const Center(child: Text('Пусто')),
              _ => state.maybeMap(
                  orElse: () => LoadingBody(),
                  failure: (state) => ErrorBody(
                    message: state.failure.message,
                    onRetry: DeviceScenariosScope.of(context).fetch,
                  ),
                ),
            };
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<DeviceScenarioEntity> data) {
    return DeviceScenarioRunBlocListener(
      listener: (context, state) => state.mapOrNull(
        success: (state) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Сценарий запущен'),
          ),
        ),
      ),
      child: ListView.builder(
        padding: AppPaddings.horizontal.copyWith(top: 20),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Padding(
            key: ValueKey(item.id),
            padding: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () {
                context.navigator.push(
                  DeviceScenarioScreen(scenario: item).page,
                );
              },
              child: Container(
                constraints: BoxConstraints(minHeight: 60),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          DeviceScenarioRunScope.of(context).run(id: item.id),
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.name,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.chevron_right),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

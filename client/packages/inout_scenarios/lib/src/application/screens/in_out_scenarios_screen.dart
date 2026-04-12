import 'package:common/common.dart';
import 'package:inout_scenarios/src/application/application.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

class InOutScenariosScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const InOutScenariosScreen({super.key});

  @override
  Widget wrappedScreen(BuildContext context) {
    return InOutScenariosScope(
      projectId: context.read<ProjectIdController>().value!,
      child: this,
    );
  }

  @override
  State<InOutScenariosScreen> createState() => _InOutScenariosScreenState();
}

class _InOutScenariosScreenState extends State<InOutScenariosScreen> {
  @override
  void initState() {
    super.initState();
    InOutScenariosScope.of(context).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сценарии контроллера'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.navigator.push(
                InOutScenarioScreen().page,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final state = InOutScenariosScope.of(context, listen: true).state;
            return switch (state.data) {
              List<InOutScenarioEntity> data when data.isNotEmpty =>
                buildBody(context, data),
              List<InOutScenarioEntity> data when data.isEmpty =>
                const Center(child: Text('Пусто')),
              _ => state.maybeMap(
                  orElse: () => LoadingBody(),
                  failure: (state) => ErrorBody(
                    message: state.failure.message,
                    onRetry: InOutScenariosScope.of(context).fetch,
                  ),
                ),
            };
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<InOutScenarioEntity> data) {
    return ListView.builder(
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
                InOutScenarioScreen(scenario: item).page,
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(item.name)),
                  const SizedBox(width: 8),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

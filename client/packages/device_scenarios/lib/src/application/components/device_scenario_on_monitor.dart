import 'package:common/common.dart';
import 'package:device_scenarios/device_scenarios.dart';
import 'package:device_scenarios/src/application/application.dart';

class DeviceScenarioOnMonitor extends StatelessWidget {
  const DeviceScenarioOnMonitor({
    super.key,
    required this.scenario,
  });

  final DeviceScenarioEntity scenario;
  @override
  Widget build(BuildContext context) {
    return DeviceScenarioRunScope(
      projectId: context.read<ProjectIdController>().value!,
      child: DeviceScenarioRunBlocListener(
        listener: (context, state) => state.mapOrNull(
          success: (state) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Сценарий запущен'),
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            context.navigator.push(
              DeviceScenarioScreen(scenario: scenario).page,
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                .copyWith(right: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF6F6F6F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        DeviceScenarioRunScope.of(context).run(id: scenario.id);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 75, 75, 75),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]),
                        child: Icon(Icons.play_arrow),
                      ),
                    );
                  }),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          scenario.name,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:inout_scenarios/inout_scenarios.dart';

class ControlBoxHubDeviceBody extends StatelessWidget {
  const ControlBoxHubDeviceBody({super.key, required this.device});

  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilderWidget(
      initState: (context) {
        if (InOutScenariosScope.of(context, listen: false).state.hasData) {
          return;
        }
        InOutScenariosScope.of(context, listen: false).fetch();
      },
      builder: (context, child) => child,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Устройства контроллера',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(height: 8),
          DevicesBlocBuilder(
            filter: (device) =>
                device.providerType == DeviceProviderType.logoSiemens,
            builder: (context, data) {
              return Column(
                children: [
                  for (var d in data)
                    GestureDetector(
                      onTap: () {
                        context.navigator.push(
                          ControllerDeviceEditScreen(device: d).page,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: context.theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            getIconsByDeviceType(type: d.type)
                                .icon
                                .svg(width: 20, height: 20),
                            const SizedBox(width: 8),
                            Text(d.name),
                            Text(d.providerDeviceId != null
                                ? ' (${d.providerDeviceId})'
                                : ''),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          Center(
            child: TextButton(
              onPressed: () {
                context.navigator.push(
                  ControllerDeviceEditScreen().page,
                );
              },
              child: const Text('+ Добавить устройство'),
            ),
          ),
          Divider(),
          const SizedBox(height: 8),
          Text(
            'Сценарии контроллера',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Builder(
            builder: (context) {
              final state = InOutScenariosScope.of(context, listen: true).state;
              if (state.hasData == false) {
                return SizedBox();
              }
              return Column(
                children: [
                  for (var item in state.data!)
                    GestureDetector(
                      onTap: () {
                        context.navigator.push(
                          InOutScenarioScreen(scenario: item).page,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: context.theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.name.isNotEmpty) ...[
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ],
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Если: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 194, 194, 194),
                                    ),
                                  ),
                                  TextSpan(
                                    text: _conditionToString(item.condition),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Тогда: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 194, 194, 194),
                                    ),
                                  ),
                                  TextSpan(
                                    text: _actionsToString(item.actions),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          Center(
            child: TextButton(
              onPressed: () {
                context.navigator.push(
                  InOutScenarioScreen().page,
                );
              },
              child: const Text('+ Добавить сценарий'),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

String _conditionToString(ConditionEntity condition) {
  return condition.map(
    logic: (condition) => condition.conditions
        .map(_conditionToString)
        .join(' ${switch (condition.logic) {
          ConditionLogicType.and => 'и',
          ConditionLogicType.or => 'или',
        }} '),
    state: (conditionState) =>
        '${conditionState.deviceId} ${switch (conditionState.state) {
      ConditionStateType.on => 'включено',
      ConditionStateType.off => 'выключено',
      ConditionStateType.change => 'изменилось',
    }}',
  );
}

String _actionsToString(List<ActionEntity> actions) {
  return actions
      .map((action) => action.map(
            changeDevice: (action) =>
                'устройство ${action.deviceId} ${switch (action.state) {
              true => 'включить',
              false => 'выключить',
              null => 'переключить',
            }}',
            delay: (action) => 'ждать ${action.seconds} сек.',
          ))
      .join(', ');
}

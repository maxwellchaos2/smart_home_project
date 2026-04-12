import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

class ActionChangeOutputModalScreen extends StatefulWidget {
  const ActionChangeOutputModalScreen({
    super.key,
  });

  Future<ActionEntity?> show(BuildContext context) {
    return showCupertinoSheet(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  State<ActionChangeOutputModalScreen> createState() =>
      _ActionChangeOutputModalScreenState();
}

class _ActionChangeOutputModalScreenState
    extends State<ActionChangeOutputModalScreen> {
  late final ValueNotifier<String?> _outputIdController;
  late final ValueNotifier<bool?> _stateController;

  @override
  void initState() {
    super.initState();
    _outputIdController = ValueNotifier(null);
    _stateController = ValueNotifier(null);
  }

  @override
  void dispose() {
    _outputIdController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  void _submit() {
    final action = ActionEntity.changeDevice(
      deviceId: _outputIdController.value!,
      state: _stateController.value,
    );
    Navigator.of(context).pop(action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.horizontal.copyWith(top: 25),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Действие сценария',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)
                      .reverseMerge(context.textTheme.titleLarge),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Устройство',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ).reverseMerge(context.textTheme.titleMedium),
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder<String?>(
                valueListenable: _outputIdController,
                builder: (context, value, child) {
                  final devices = DevicesScope.of(context, listen: true)
                      .state
                      .data!
                      .where(
                        (e) => e.providerType == DeviceProviderType.logoSiemens,
                      );
                  return PopupMenuButton<String>(
                    constraints: const BoxConstraints(maxHeight: 400),
                    itemBuilder: (context) => [
                      ...devices.map(
                        (device) => PopupMenuItem(
                          value: device.providerDeviceId,
                          child: Text(
                            device.name,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.navigator.pushRoute('/add_controller_device');
                        },
                        child: Text(
                          'Добавить устройство',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      )
                    ],
                    onSelected: (value) {
                      _outputIdController.value = value;
                    },
                    child: InputDecorator(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                      ),
                      child: Text(
                        devices
                                .firstWhereOrNull(
                                  (device) => device.providerDeviceId == value,
                                )
                                ?.name ??
                            'Выберите устройство',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text('Переключить на'),
              AnimatedBuilder(
                animation: _stateController,
                builder: (context, _) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ChoiceChip(
                        label: Text('Переключить'),
                        selected: _stateController.value == null,
                        onSelected: (value) {
                          _stateController.value = null;
                        },
                      ),
                      ChoiceChip(
                        label: Text('Включить'),
                        selected: _stateController.value == true,
                        onSelected: (value) {
                          _stateController.value = true;
                        },
                      ),
                      ChoiceChip(
                        label: Text('Выключить'),
                        selected: _stateController.value == false,
                        onSelected: (value) {
                          _stateController.value = false;
                        },
                      ),
                    ],
                  );
                },
              ),
              Spacer(),
              const SizedBox(height: 30),
              AppFormButton.primary(
                onPressed: _submit,
                child: Text('Добавить'),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

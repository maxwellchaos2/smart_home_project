import 'package:common/common.dart';
import 'package:device_scenarios/src/application/application.dart';
import 'package:device_scenarios/src/domain/domain.dart';
import 'package:devices/devices.dart';

final class DeviceScenarioScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const DeviceScenarioScreen({
    super.key,
    this.scenario,
  });

  final DeviceScenarioEntity? scenario;

  @override
  Widget wrappedScreen(BuildContext context) {
    final projectId = context.read<ProjectIdController>().value!;
    return MultiProvider(
      providers: [
        if (scenario case DeviceScenarioEntity scenario) ...[
          UpdateDeviceScenarioScope(
            scenarioId: scenario.id,
            projectId: projectId,
          ),
          DeleteDeviceScenarioScope(
            scenarioId: scenario.id,
            projectId: projectId,
          ),
        ] else ...[
          CreateDeviceScenarioScope(
            projectId: projectId,
          ),
        ],
      ],
      child: this,
    );
  }

  @override
  State<DeviceScenarioScreen> createState() => _DeviceScenarioScreenState();
}

class _DeviceScenarioScreenState
    extends StateWithListeners<DeviceScenarioScreen> {
  late final TextEditingController _nameController;
  late final ValueNotifier<ConditionEntity> _conditionController;
  late final ValueNotifier<List<ActionEntity>> _actionsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.scenario?.name,
    );
    _conditionController = ValueNotifier(
      widget.scenario?.condition ??
          ConditionEntity.logic(
            logic: ConditionLogicType.or,
            conditions: [],
          ),
    );
    _actionsController = ValueNotifier(
      widget.scenario?.actions ?? [],
    );
  }

  void _addCondition({required ConditionEntity toCondition}) async {
    final device = await ChooseDeviceModalScreen().show(context);
    if (device == null) return;
    final result = await ConditionModalScreen(
      currentCondition: toCondition,
      device: device,
      isFirst: toCondition == _conditionController.value,
    ).show(context);
    if (result != null) {
      final newCondition = result.condition;
      if (result.isNew) {
        _conditionController.value =
            (_conditionController.value as ConditionLogicEntity).copyWith(
          conditions: [
            ...(_conditionController.value as ConditionLogicEntity).conditions,
            newCondition,
          ],
        );
      } else {
        _conditionController.value =
            (_conditionController.value as ConditionLogicEntity).copyWith(
          conditions: [
            ...(_conditionController.value as ConditionLogicEntity)
                .conditions
                .map(
                  (condition) =>
                      condition == toCondition ? newCondition : condition,
                ),
          ],
        );
      }
    }
  }

  void _deleteCondition({
    required ConditionEntity condition,
    required ConditionLogicEntity fromCondition,
  }) {
    _conditionController.value = fromCondition.copyWith(
      conditions:
          fromCondition.conditions.where((c) => c != condition).toList(),
    );
  }

  Future<List<ActionEntity>?> _chooseDeviceAction() async {
    final device = await ChooseDeviceModalScreen().show(context);
    if (device == null) return null;
    return await ActionChangeDeviceStateModalScreen(device: device)
        .show(context);
  }

  void _addAction() async {
    final result1 = await ChoiceActionTypeModalScreen().show(context);
    if (result1 != null) {
      final result2 = await switch (result1) {
        ActionType.changeOutput => _chooseDeviceAction(),
        // ignore: use_build_context_synchronously

        // ignore: use_build_context_synchronously
        ActionType.delay =>
          ActionDelayModalScreen().show(context).then((value) {
            if (value == null) return null;
            return [value];
          }),
      };
      if (result2 != null) {
        _actionsController.value = [
          ..._actionsController.value,
          ...result2,
        ];
      }
    }
  }

  void _deleteAction(int i) {
    _actionsController.value = [
      for (final (j, action) in _actionsController.value.indexed)
        if (i != j) action,
    ];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _conditionController.dispose();
    _actionsController.dispose();
    super.dispose();
  }

  void _submit() {
    final scenario = DeviceScenarioInputEntity(
      name: _nameController.text,
      condition: _conditionController.value,
      actions: _actionsController.value,
    );
    if ((scenario.condition as ConditionLogicEntity).conditions.isEmpty) {
      context.app.showErrorDialog(message: 'Необходимо добавить условие');
      return;
    }
    if (scenario.actions.isEmpty) {
      context.app.showErrorDialog(message: 'Необходимо добавить действие');
      return;
    }
    if (widget.scenario case DeviceScenarioEntity _) {
      UpdateDeviceScenarioScope.of(context).update(input: scenario);
    } else {
      CreateDeviceScenarioScope.of(context).create(input: scenario);
    }
  }

  @override
  List<SingleChildWidget> get listeners => [
        if (widget.scenario case DeviceScenarioEntity _) ...[
          UpdateDeviceScenarioBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (_) => context.navigator.popForced(),
            ),
          ),
          DeleteDeviceScenarioBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (_) => context.navigator.popForced(),
            ),
          ),
        ] else ...[
          CreateDeviceScenarioBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (_) => context.navigator.popForced(),
            ),
          ),
        ],
      ];

  @override
  Widget buildChild(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            (widget.scenario != null)
                ? 'Редактирование сценария'
                : 'Создание сценария',
          ),
          actions: [
            if (widget.scenario case DeviceScenarioEntity _) ...[
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  DeleteDeviceScenarioScope.of(context).delete();
                },
              ),
            ],
          ],
        ),
        floatingActionButton: Builder(builder: (context) {
          final isLoading = switch (widget.scenario) {
            null => CreateDeviceScenarioScope.of(context, listen: true)
                .state
                .isLoading,
            _ => UpdateDeviceScenarioScope.of(context, listen: true)
                    .state
                    .isLoading ||
                DeleteDeviceScenarioScope.of(context, listen: true)
                    .state
                    .isLoading,
          };
          return FloatingActionButton(
            onPressed: _submit,
            child: isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.save),
          );
        }),
        body: SafeArea(
          child: ListView(
            padding: AppPaddings.horizontal.copyWith(top: 20),
            children: [
              Text(
                'Название сценария',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ).reverseMerge(context.textTheme.titleMedium),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Введите название сценария',
                ),
              ),
              const SizedBox(height: 20),
              _buildCondition(context),
              _buildActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCondition(BuildContext context) {
    return AnimatedBuilder(
      animation: _conditionController,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Если',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ).reverseMerge(context.textTheme.titleMedium),
            ),
            const SizedBox(height: 10),
            if ((_conditionController.value as ConditionLogicEntity)
                .conditions
                .isEmpty)
              Center(
                child: TextButton(
                  onPressed: () =>
                      _addCondition(toCondition: _conditionController.value),
                  child: Text('+ Добавить условие'),
                ),
              ),
            for (final conditionLogic
                in (_conditionController.value as ConditionLogicEntity)
                    .conditions) ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final condition
                        in (conditionLogic as ConditionLogicEntity)
                            .conditions) ...[
                      Row(
                        children: [
                          if (condition is ConditionInputStateEntity)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Вход ${(condition).inputId}',
                                    style: context.textTheme.labelMedium,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    switch (condition.state) {
                                      ConditionInputStateType.on => 'Включится',
                                      ConditionInputStateType.off =>
                                        'Выключится',
                                      ConditionInputStateType.change =>
                                        'Переключится',
                                    },
                                    style: TextStyle(
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (condition is ConditionDeviceStateEntity &&
                              condition.state is DeviceCapabilityStateOnEntity)
                            _deviceConditionRow(context, condition),
                          if (condition is ConditionDeviceEventEntity)
                            _deviceConditionEventRow(context, condition),
                          if (condition is ConditionDeviceStateValueEntity)
                            _deviceConditionStateValueRow(context, condition),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline_sharp,
                              color: context.theme.colorScheme.error
                                  .withValues(alpha: 0.5),
                            ),
                            onPressed: () => _deleteCondition(
                              condition: condition,
                              fromCondition: conditionLogic,
                            ),
                          ),
                        ],
                      ),
                      if (conditionLogic.conditions.indexOf(condition) !=
                          conditionLogic.conditions.length - 1)
                        Center(child: Text('--И--')),
                    ],
                  ],
                ),
              ),
              if (((_conditionController.value as ConditionLogicEntity)
                          .conditions)
                      .last ==
                  conditionLogic)
                Center(
                  child: TextButton(
                    onPressed: () => _addCondition(toCondition: conditionLogic),
                    child: Text('+ Добавить условие'),
                  ),
                )
              else ...[
                const SizedBox(height: 14),
                Text('ИЛИ'),
              ],
              const SizedBox(height: 10),
            ],
          ],
        );
      },
    );
  }

  Widget _deviceConditionRow(
      BuildContext context, ConditionDeviceStateEntity condition) {
    final device = DevicesScope.of(context, listen: true)
        .state
        .data!
        .firstWhereOrNull((device) => device.id == condition.deviceId);
    return Expanded(
      child: Row(
        children: [
          const SizedBox(width: 8),
          getIconsByDeviceType(type: device?.type ?? DeviceType.other).icon.svg(
                width: 24,
                height: 24,
              ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Устройство "${device?.name ?? 'Неизвестное'}"',
                  style: context.textTheme.labelMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  switch ((condition.state as DeviceCapabilityStateOnEntity)
                      .value) {
                    true => 'Включится',
                    false => 'Выключится',
                    null => 'Переключится',
                  },
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _deviceConditionStateValueRow(
      BuildContext context, ConditionDeviceStateValueEntity condition) {
    final device = DevicesScope.of(context, listen: true)
        .state
        .data!
        .firstWhereOrNull((device) => device.id == condition.deviceId);
    return Expanded(
      child: Row(
        children: [
          const SizedBox(width: 8),
          getIconsByDeviceType(type: device?.type ?? DeviceType.other).icon.svg(
                width: 24,
                height: 24,
              ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Устройство "${device?.name ?? 'Неизвестное'}"',
                  style: context.textTheme.labelMedium,
                ),
                const SizedBox(height: 2),
                Text.rich(
                  TextSpan(
                    children: [
                      switch ((condition.operator)) {
                        ConditionOperator.equal => TextSpan(text: 'Равно'),
                        ConditionOperator.notEqual =>
                          TextSpan(text: 'Не равно'),
                        ConditionOperator.greaterThan =>
                          TextSpan(text: 'Больше чем'),
                        ConditionOperator.lessThan =>
                          TextSpan(text: 'Меньше чем'),
                      },
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: '${(condition.state as dynamic).value.toInt()}',
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _deviceConditionEventRow(
      BuildContext context, ConditionDeviceEventEntity condition) {
    final device = DevicesScope.of(context, listen: true)
        .state
        .data!
        .firstWhereOrNull((device) => device.id == condition.deviceId);
    return Expanded(
      child: Row(
        children: [
          const SizedBox(width: 8),
          getIconsByDeviceType(type: device?.type ?? DeviceType.other).icon.svg(
                width: 24,
                height: 24,
              ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Устройство "${device?.name ?? 'Неизвестное'}"',
                  style: context.textTheme.labelMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  '${condition.event.key} - ${condition.event.value}',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return AnimatedBuilder(
      animation: _actionsController,
      builder: (context, _) {
        final devices = DevicesScope.of(context, listen: true).state.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Тогда',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ).reverseMerge(context.textTheme.titleMedium),
            ),
            const SizedBox(height: 10),
            for (final (i, action) in _actionsController.value.indexed) ...[
              Container(
                key: ValueKey(i),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 6),
                      child: action.map(
                        changeDeviceState: (action) => switch (
                            devices.firstWhereOrNull(
                                (device) => device.id == action.deviceId)) {
                          null => getIconsByDeviceType(type: DeviceType.other)
                              .icon
                              .svg(
                                width: 24,
                                height: 24,
                              ),
                          DeviceEntity device => getIconsByDeviceType(
                              type: device.type,
                            ).icon.svg(
                                  width: 24,
                                  height: 24,
                                ),
                        },
                        delay: (action) => Icon(Icons.timer),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            action.map(
                              changeDeviceState: (action) => switch (
                                  devices.firstWhereOrNull((device) =>
                                      device.id == action.deviceId)) {
                                null => 'Устройство не найдено',
                                DeviceEntity device => device.name,
                              },
                              delay: (action) => 'Задержка',
                            ),
                            style: context.textTheme.labelMedium,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            action.map(
                                changeDeviceState: (action) =>
                                    action.state.mapOrNull(
                                      on: (state) => switch (state.value) {
                                        null => 'Переключить',
                                        true => 'Включится',
                                        false => 'Выключится',
                                      },
                                      open: (state) => switch (state.value) {
                                        0 => 'Закроется',
                                        1 => 'Откроется',
                                        _ => 'Откроется на ${state.value}%',
                                      },
                                      temperature: (state) =>
                                          'Установится на ${state.value.toInt()}°C',
                                    ) ??
                                    'Неизвестное состояние',
                                delay: (action) =>
                                    'На ${action.seconds} секунд'),
                            style: TextStyle(
                              color: context.theme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline_sharp,
                        color: context.theme.colorScheme.error
                            .withValues(alpha: 0.5),
                      ),
                      onPressed: () => _deleteAction(
                        i,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
            Center(
              child: TextButton(
                onPressed: _addAction,
                child: Text('+ Добавить действие'),
              ),
            ),
          ],
        );
      },
    );
  }
}

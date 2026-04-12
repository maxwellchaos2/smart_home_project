import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:inout_scenarios/src/application/application.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

final class InOutScenarioScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const InOutScenarioScreen({
    super.key,
    this.scenario,
  });

  final InOutScenarioEntity? scenario;

  @override
  Widget wrappedScreen(BuildContext context) {
    return MultiProvider(
      providers: [
        if (scenario case InOutScenarioEntity scenario) ...[
          UpdateInOutScenarioScope(
            scenarioId: scenario.id,
            projectId: context.read<ProjectIdController>().value!,
          ),
          DeleteInOutScenarioScope(
            scenarioId: scenario.id,
            projectId: context.read<ProjectIdController>().value!,
          ),
        ] else ...[
          CreateInOutScenarioScope(
            projectId: context.read<ProjectIdController>().value!,
          ),
        ],
      ],
      child: this,
    );
  }

  @override
  State<InOutScenarioScreen> createState() => _InOutScenarioScreenState();
}

class _InOutScenarioScreenState
    extends StateWithListeners<InOutScenarioScreen> {
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
    final result = await ConditionModalScreen(
      currentCondition: toCondition,
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
    required ConditionStateEntity condition,
    required ConditionLogicEntity fromCondition,
  }) {
    final newCondition = fromCondition.copyWith(
      conditions:
          fromCondition.conditions.where((c) => c != condition).toList(),
    );
    final conditionIsEmpty = newCondition.conditions.isEmpty;
    if (conditionIsEmpty) {
      _conditionController.value =
          (_conditionController.value as ConditionLogicEntity).copyWith(
        conditions: [
          ...(_conditionController.value as ConditionLogicEntity)
              .conditions
              .where((c) => c != fromCondition),
        ],
      );
      return;
    }
    _conditionController.value =
        (_conditionController.value as ConditionLogicEntity).copyWith(
      conditions: [
        ...(_conditionController.value as ConditionLogicEntity).conditions.map(
              (c) => c == fromCondition ? newCondition : c,
            ),
      ],
    );
  }

  void _addAction() async {
    final result1 = await ChoiceActionTypeModalScreen().show(context);
    if (result1 != null) {
      final result2 = await switch (result1) {
        ActionType.changeOutput =>
          // ignore: use_build_context_synchronously
          ActionChangeOutputModalScreen().show(context),
        // ignore: use_build_context_synchronously
        ActionType.delay => ActionDelayModalScreen().show(context),
      };
      if (result2 != null) {
        _actionsController.value = [
          ..._actionsController.value,
          result2,
        ];
      }
    }
  }

  void _deleteAction(ActionEntity action) {
    _actionsController.value =
        _actionsController.value.where((a) => a != action).toList();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _conditionController.dispose();
    _actionsController.dispose();
    super.dispose();
  }

  void _submit() {
    final scenario = InOutScenarioInputEntity(
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
    if (widget.scenario case InOutScenarioEntity _) {
      UpdateInOutScenarioScope.of(context).update(input: scenario);
    } else {
      CreateInOutScenarioScope.of(context).create(input: scenario);
    }
  }

  @override
  List<SingleChildWidget> get listeners => [
        if (widget.scenario case InOutScenarioEntity _) ...[
          UpdateInOutScenarioBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (_) => context.navigator.popForced(),
            ),
          ),
          DeleteInOutScenarioBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (_) => context.navigator.popForced(),
            ),
          ),
        ] else ...[
          CreateInOutScenarioBlocListener(
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
            if (widget.scenario case InOutScenarioEntity _) ...[
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  DeleteInOutScenarioScope.of(context).delete();
                },
              ),
            ],
          ],
        ),
        floatingActionButton: Builder(builder: (context) {
          final isLoading = switch (widget.scenario) {
            null => CreateInOutScenarioScope.of(context, listen: true)
                .state
                .isLoading,
            _ => UpdateInOutScenarioScope.of(context, listen: true)
                    .state
                    .isLoading ||
                DeleteInOutScenarioScope.of(context, listen: true)
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
                textCapitalization: TextCapitalization.sentences,
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
                        in (conditionLogic as ConditionLogicEntity).conditions)
                      if (condition is ConditionStateEntity) ...[
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Вход ${condition.deviceId}',
                                    style: context.textTheme.labelMedium,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    switch (condition.state) {
                                      ConditionStateType.on => 'Включится',
                                      ConditionStateType.off => 'Выключится',
                                      ConditionStateType.change =>
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

  Widget _buildActions(BuildContext context) {
    return AnimatedBuilder(
      animation: _actionsController,
      builder: (context, _) {
        final devices = DevicesScope.of(context, listen: true)
            .state
            .data!
            .where((e) => e.providerType == DeviceProviderType.logoSiemens);
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
            for (final action in _actionsController.value) ...[
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            action.map(
                              changeDevice: (action) => switch (
                                  devices.firstWhereOrNull((device) =>
                                      device.providerDeviceId ==
                                      action.deviceId)) {
                                null => 'Выход ${action.deviceId}',
                                DeviceEntity device => device.name,
                              },
                              delay: (action) => 'Задержка',
                            ),
                            style: context.textTheme.labelMedium,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            action.map(
                                changeDevice: (action) =>
                                    switch (action.state) {
                                      true => 'Включится',
                                      false => 'Выключится',
                                      null => 'Переключится',
                                    },
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
                        action,
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

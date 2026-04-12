import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

class ConditionModalScreen extends StatefulWidget {
  const ConditionModalScreen({
    super.key,
    required this.currentCondition,
    required this.isFirst,
  });

  final ConditionEntity currentCondition;
  final bool isFirst;

  Future<ConditionModalScreenResult?> show(BuildContext context) {
    return showCupertinoSheet(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  State<ConditionModalScreen> createState() => _ConditionModalScreenState();
}

class _ConditionModalScreenState extends State<ConditionModalScreen> {
  late final ValueNotifier<ConditionInOutType> _typeController;
  late final ValueNotifier<String?> _inOutIdController;
  late final ValueNotifier<ConditionStateType> stateController;
  late final ValueNotifier<ConditionLogicType> _logicController;

  @override
  void initState() {
    super.initState();
    _typeController = ValueNotifier(ConditionInOutType.in_);
    _inOutIdController = ValueNotifier(null);
    stateController = ValueNotifier(ConditionStateType.change);
    _logicController = ValueNotifier(
        widget.isFirst ? ConditionLogicType.and : ConditionLogicType.or);
  }

  @override
  void dispose() {
    _typeController.dispose();
    _inOutIdController.dispose();
    stateController.dispose();
    _logicController.dispose();
    super.dispose();
  }

  void _submit() {
    final condition = ConditionEntity.state(
      deviceId: _inOutIdController.value!,
      state: stateController.value,
    );
    if (!widget.isFirst && _logicController.value == ConditionLogicType.and) {
      final result = (widget.currentCondition as ConditionLogicEntity).copyWith(
        conditions: [
          ...(widget.currentCondition as ConditionLogicEntity).conditions,
          condition,
        ],
      );
      Navigator.of(context).pop(
        (
          isNew: false,
          condition: result,
        ),
      );
    } else {
      final result = ConditionEntity.logic(
        logic: ConditionLogicType.and,
        conditions: [
          condition,
        ],
      );
      Navigator.of(context).pop(
        (
          isNew: true,
          condition: result,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.horizontal.copyWith(top: 18),
          child: SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Условие сценария',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)
                        .reverseMerge(context.textTheme.titleLarge),
                  ),
                ),
                // Text('Тип'),
                // AnimatedBuilder(
                //   animation: _typeController,
                //   builder: (context, _) {
                //     return Wrap(
                //       spacing: 10,
                //       runSpacing: 10,
                //       children: [
                //         ChoiceChip(
                //           label: Text('Вход'),
                //           selected:
                //               _typeController.value == ConditionInOutType.in_,
                //           onSelected: (value) {
                //             _typeController.value = ConditionInOutType.in_;
                //           },
                //         ),
                //         ChoiceChip(
                //           label: Text('Выход'),
                //           selected:
                //               _typeController.value == ConditionInOutType.out,
                //           onSelected: (value) {
                //             _typeController.value = ConditionInOutType.out;
                //           },
                //         ),
                //       ],
                //     );
                //   },
                // ),
                const SizedBox(height: 40),
                // Text('Тип'),
                // ValueListenableBuilder<int?>(
                //   valueListenable: _inOutIdController,
                //   builder: (context, value, child) {
                //     return TextFormField(
                //       initialValue: value?.toString(),
                //       keyboardType: TextInputType.number,
                //       onChanged: (value) {
                //         _inOutIdController.value = int.tryParse(value);
                //       },
                //       decoration: InputDecoration(
                //         labelText: 'ID',
                //       ),
                //     );
                //   },
                // ),
                Text(
                  'Вход',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ).reverseMerge(context.textTheme.titleMedium),
                ),
                const SizedBox(height: 2),
                Text(
                  'Например, "кнопка, выключатель света"',
                  style: context.textTheme.labelMedium,
                ),
                const SizedBox(height: 8),
                ValueListenableBuilder<String?>(
                  valueListenable: _inOutIdController,
                  builder: (context, value, child) {
                    return PopupMenuButton<String>(
                      constraints: BoxConstraints(
                        maxHeight: 400,
                        minWidth: 100,
                      ),
                      itemBuilder: (context) => List.generate(
                        24,
                        (index) => PopupMenuItem(
                          value: 'I${index + 1}',
                          child: Text(
                            'I${index + 1}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onSelected: (value) {
                        _inOutIdController.value = value;
                      },
                      child: InputDecorator(
                        isEmpty: value == null,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                          hintText: 'Выберите вход',
                        ),
                        child: value == null ? null : Text(value),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text('Состояние'),
                AnimatedBuilder(
                  animation: stateController,
                  builder: (context, _) {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ChoiceChip(
                          label: Text('Переключится'),
                          selected: stateController.value ==
                              ConditionStateType.change,
                          onSelected: (value) {
                            stateController.value = ConditionStateType.change;
                          },
                        ),
                        ChoiceChip(
                          label: Text('Включится'),
                          selected:
                              stateController.value == ConditionStateType.on,
                          onSelected: (value) {
                            stateController.value = ConditionStateType.on;
                          },
                        ),
                        ChoiceChip(
                          label: Text('Выключится'),
                          selected:
                              stateController.value == ConditionStateType.off,
                          onSelected: (value) {
                            stateController.value = ConditionStateType.off;
                          },
                        ),
                      ],
                    );
                  },
                ),
                // if (!widget.isFirst) ...[
                //   const SizedBox(height: 20),
                //   Text('Логика'),
                //   AnimatedBuilder(
                //     animation: _logicController,
                //     builder: (context, _) {
                //       return Wrap(
                //         spacing: 10,
                //         runSpacing: 10,
                //         children: [
                //           ChoiceChip(
                //             label: Text('И'),
                //             selected: _logicController.value ==
                //                 ConditionLogicType.and,
                //             onSelected: (value) {
                //               _logicController.value = ConditionLogicType.and;
                //             },
                //           ),
                //           ChoiceChip(
                //             label: Text('ИЛИ'),
                //             selected:
                //                 _logicController.value == ConditionLogicType.or,
                //             onSelected: (value) {
                //               _logicController.value = ConditionLogicType.or;
                //             },
                //           ),
                //         ],
                //       );
                //     },
                //   ),
                // ],
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
      ),
    );
  }
}

enum ConditionInOutType {
  in_,
  out,
}

typedef ConditionModalScreenResult = ({
  bool isNew,
  ConditionEntity condition,
});

import 'package:common/common.dart';
import 'package:device_scenarios/src/domain/domain.dart';
import 'package:devices/devices.dart';
import 'package:flutter/cupertino.dart';

class ConditionModalScreen extends StatefulWidget {
  const ConditionModalScreen({
    super.key,
    required this.currentCondition,
    required this.isFirst,
    required this.device,
  });

  final ConditionEntity currentCondition;
  final bool isFirst;
  final DeviceEntity device;

  Future<ConditionModalScreenResult?> show(BuildContext context) {
    return showCupertinoSheet(
      context: context,
      pageBuilder: (context) => this,
    );
  }

  @override
  State<ConditionModalScreen> createState() => _ConditionModalScreenState();
}

class _ConditionModalScreenState extends State<ConditionModalScreen> {
  late final ValueNotifier<ConditionLogicType> _logicController;
  late final ValueNotifier<MapEntry<int, DeviceCapabilityStateEntity>?>
      _stateController;

  late final ValueNotifier<MapEntry<String, ConditionOperator>?>
      _stateOperatorController;
  late final ValueNotifier<MapEntry<String, String?>?> _eventController;
  late final Map<int, DeviceCapabilityStateEntity> _availableStates;

  late final Map<String, List<String>> _availableEvents;

  @override
  void initState() {
    super.initState();
    _logicController = ValueNotifier(
        widget.isFirst ? ConditionLogicType.and : ConditionLogicType.or);
    _availableStates = Map.fromEntries([
      for (final capability in widget.device.capabilities)
        if (capability.state is DeviceCapabilityStateOnEntity)
          DeviceCapabilityStateEntity.on(value: null)
        else if (capability.state is DeviceCapabilityStateOpenEntity)
          DeviceCapabilityStateEntity.open(
              value: widget.device.capabilities
                      .parametersByType<DeviceCapabilityParametersOpenEntity>()
                      .range
                      ?.min ??
                  0)
        else if (capability.state is DeviceCapabilityStateTemperatureEntity)
          DeviceCapabilityStateEntity.temperature(
              value: widget.device.capabilities
                      .parametersByType<
                          DeviceCapabilityParametersTemperatureEntity>()
                      .range
                      ?.min ??
                  0),
      for (final property in widget.device.properties)
        if (property is DevicePropertyFloatEntity)
          if (property.state is DeviceCapabilityStateTemperatureEntity)
            DeviceCapabilityStateEntity.temperature(
                value: (property.parameters
                            as DeviceCapabilityParametersTemperatureEntity)
                        .range
                        ?.min ??
                    20)
          else if (property.state is DeviceCapabilityStateHumidityEntity)
            DeviceCapabilityStateEntity.humidity(value: 20)
    ].mapIndexed((index, state) {
      return MapEntry(index, state);
    }));
    _stateController = ValueNotifier(null);

    _availableEvents = {
      for (final property in widget.device.properties)
        if (property is DevicePropertyEventEntity &&
            property.parameters != null)
          property.parameters!['instance'] as String: List<String>.from(
            property.parameters!['events']?.map((e) => e['value']) ?? [],
          ),
    };

    _eventController = ValueNotifier(null);

    _stateOperatorController = ValueNotifier(null);
  }

  @override
  void dispose() {
    _logicController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  void _submit() {
    late final ConditionEntity condition;
    if (_stateController.value == null && _eventController.value == null) {
      context.app.showErrorDialog(message: 'Заполните все поля');
      return;
    }
    if (_stateController.value?.value is DeviceCapabilityStateOpenEntity ||
        _stateController.value?.value
            is DeviceCapabilityStateTemperatureEntity ||
        _stateController.value?.value is DeviceCapabilityStateHumidityEntity) {
      condition = ConditionEntity.deviceStateValue(
        deviceId: widget.device.id,
        state: _stateController.value!.value,
        operator:
            _stateOperatorController.value?.value ?? ConditionOperator.equal,
      );
    } else if (_stateController.value != null) {
      condition = ConditionEntity.deviceState(
        deviceId: widget.device.id,
        state: _stateController.value!.value,
      );
    } else if (_eventController.value != null) {
      condition = ConditionEntity.deviceEvent(
        deviceId: widget.device.id,
        event: (
          key: _eventController.value!.key,
          value: _eventController.value!.value
        ),
      );
    }
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

  String _getEventTranslation(String event) {
    return {
          'open': 'Событие открытия',
          'button': 'Нажатие кнопки',
        }[event] ??
        event;
  }

  String _getEventValueTranslation(String event) {
    return {
          'opened': 'Откроется',
          'closed': 'Закроется',
          'click': 'Одно нажатие',
          'double_click': 'Двойное нажатие',
          'long_press': 'Длительное нажатие',
          'click_2': 'Одно нажатие (2)',
          'double_click_2': 'Двойное нажатие (2)',
          'long_press_2': 'Длительное нажатие (2)',
        }[event] ??
        event;
  }

  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.horizontal.copyWith(top: 18),
          child: SafeArea(
            top: false,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
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
                    const SizedBox(height: 40),
                    if (_availableStates.isNotEmpty) ...[
                      Text(
                        'Состояние устройства',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ).reverseMerge(context.textTheme.titleMedium),
                      ),
                      const SizedBox(height: 8),
                      ValueListenableBuilder<
                          MapEntry<int, DeviceCapabilityStateEntity>?>(
                        valueListenable: _stateController,
                        builder: (context, v, child) {
                          return PopupMenuButton<
                              MapEntry<int, DeviceCapabilityStateEntity>>(
                            constraints: const BoxConstraints(maxHeight: 400),
                            itemBuilder: (context) => [
                              for (final state in _availableStates.entries)
                                PopupMenuItem(
                                  value: state,
                                  child: Text(
                                    switch (state.value) {
                                      DeviceCapabilityStateOnEntity() =>
                                        'Включится/Выключится',
                                      DeviceCapabilityStateOpenEntity() =>
                                        'Откроется/Закроется',
                                      DeviceCapabilityStateTemperatureEntity() =>
                                        'Температура',
                                      DeviceCapabilityStateHumidityEntity() =>
                                        'Влажность',
                                      _ => 'Неизвестно',
                                    },
                                  ),
                                ),
                            ],
                            onSelected: (value) {
                              _stateController.value = value;
                            },
                            child: Builder(builder: (context) {
                              final state = _stateController.value;
                              return InputDecorator(
                                isEmpty: state == null,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.arrow_drop_down),
                                  hintText: 'Выберите состояние',
                                ),
                                child: state?.value == null
                                    ? null
                                    : Text(
                                        switch (state?.value) {
                                          DeviceCapabilityStateOnEntity() =>
                                            'Включится/Выключится',
                                          DeviceCapabilityStateOpenEntity() =>
                                            'Откроется/Закроется',
                                          DeviceCapabilityStateTemperatureEntity() =>
                                            'Температура',
                                          DeviceCapabilityStateHumidityEntity() =>
                                            'Влажность',
                                          _ => 'Неизвестно',
                                        },
                                      ),
                              );
                            }),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder<
                          MapEntry<int, DeviceCapabilityStateEntity>?>(
                        valueListenable: _stateController,
                        builder: (context, v, child) {
                          final state = v?.value;
                          if (state == null) {
                            return const SizedBox.shrink();
                          }
                          if (state is DeviceCapabilityStateOnEntity) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Значение'),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    ChoiceChip(
                                      label: Text('Переключится'),
                                      selected: state.value == null,
                                      onSelected: (value) {
                                        _stateController.value = MapEntry(
                                          v!.key,
                                          DeviceCapabilityStateOnEntity(
                                              value: null),
                                        );
                                      },
                                    ),
                                    ChoiceChip(
                                      label: Text('Включится'),
                                      selected: state.value == true,
                                      onSelected: (value) {
                                        _stateController.value = MapEntry(
                                          v!.key,
                                          DeviceCapabilityStateOnEntity(
                                              value: true),
                                        );
                                      },
                                    ),
                                    ChoiceChip(
                                      label: Text('Выключится'),
                                      selected: state.value == false,
                                      onSelected: (value) {
                                        _stateController.value = MapEntry(
                                          v!.key,
                                          DeviceCapabilityStateOnEntity(
                                              value: false),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                          if (state
                              case DeviceCapabilityStateTemperatureEntity()) {
                            late final DeviceCapabilityParametersTemperatureEntity
                                parameters;
                            try {
                              parameters = widget.device.capabilities
                                  .parametersByType<
                                      DeviceCapabilityParametersTemperatureEntity>();
                            } catch (e) {
                              parameters = widget.device.properties
                                  .parametersByType<
                                      DeviceCapabilityParametersTemperatureEntity>();
                            }
                            return ConditionValueForm(
                              state: state,
                              parameters: parameters,
                              stateOperatorController: _stateOperatorController,
                              onChanged: (value) {
                                _stateController.value = MapEntry(
                                  v!.key,
                                  DeviceCapabilityStateTemperatureEntity(
                                    value: value,
                                  ),
                                );
                              },
                            );
                          }
                          if (state
                              case DeviceCapabilityStateHumidityEntity()) {
                            late final DeviceCapabilityParametersHumidityEntity
                                parameters;
                            try {
                              parameters = widget.device.capabilities
                                  .parametersByType<
                                      DeviceCapabilityParametersHumidityEntity>();
                            } catch (e) {
                              parameters = widget.device.properties
                                  .parametersByType<
                                      DeviceCapabilityParametersHumidityEntity>();
                            }
                            return ConditionValueForm(
                              state: state,
                              parameters: parameters,
                              stateOperatorController: _stateOperatorController,
                              onChanged: (value) {
                                _stateController.value = MapEntry(
                                  v!.key,
                                  DeviceCapabilityStateHumidityEntity(
                                    value: value,
                                  ),
                                );
                              },
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ] else if (_availableEvents.isNotEmpty) ...[
                      Text(
                        'Событие устройства',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ).reverseMerge(context.textTheme.titleMedium),
                      ),
                      const SizedBox(height: 8),
                      ValueListenableBuilder<MapEntry<String, String?>?>(
                        valueListenable: _eventController,
                        builder: (context, v, child) {
                          return PopupMenuButton<MapEntry<String, String>>(
                            constraints: const BoxConstraints(maxHeight: 400),
                            itemBuilder: (context) => [
                              for (final event in _availableEvents.entries)
                                PopupMenuItem(
                                  value: MapEntry(event.key, event.value.first),
                                  child: Text(_getEventTranslation(event.key)),
                                ),
                            ],
                            onSelected: (value) {
                              _eventController.value = value;
                            },
                            child: Builder(builder: (context) {
                              final event = _eventController.value;
                              return InputDecorator(
                                isEmpty: event == null,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.arrow_drop_down),
                                  hintText: 'Выберите событие',
                                ),
                                child: event?.key == null
                                    ? null
                                    : Text(_getEventTranslation(event!.key)),
                              );
                            }),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder<MapEntry<String, String?>?>(
                        valueListenable: _eventController,
                        builder: (context, v, child) {
                          final state = v?.value;
                          if (v == null) {
                            return const SizedBox.shrink();
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Событие'),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  ChoiceChip(
                                    label: Text('Переключится'),
                                    selected: v.value == null,
                                    onSelected: (value) {
                                      _eventController.value =
                                          MapEntry(v.key, null);
                                    },
                                  ),
                                  for (final event in _availableEvents[v.key]!)
                                    ChoiceChip(
                                      label: Text(
                                          _getEventValueTranslation(event)),
                                      selected: state == event,
                                      onSelected: (value) {
                                        _eventController.value =
                                            MapEntry(v.key, event);
                                      },
                                    ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                    // AnimatedBuilder(
                    //     animation: _deviceIdController,
                    //     builder: (context, _) {
                    //       final deviceId = _deviceIdController.value;
                    //       final device = deviceId == -1
                    //           ? null
                    //           : DevicesScope.of(context, listen: true)
                    //               .state
                    //               .data!
                    //               .firstWhereOrNull(
                    //                 (device) => device.id == deviceId,
                    //               );

                    //       return Column(
                    //         children: [
                    //           for (final property in device?.properties ??
                    //               <DevicePropertyEntity>[])
                    //             if (property is DevicePropertyEventEntity)
                    //               Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text('Событие'),
                    //                   AnimatedBuilder(
                    //                     animation: onStateController,
                    //                     builder: (context, _) {
                    //                       return Wrap(
                    //                         spacing: 10,
                    //                         runSpacing: 10,
                    //                         children: [
                    //                           for (final event in property
                    //                                   .parameters?['events'] ??
                    //                               [])
                    //                             ChoiceChip(
                    //                               label: Text(event['name']),
                    //                               selected: onStateController
                    //                                       .value ==
                    //                                   ConditionInputStateType
                    //                                       .change,
                    //                               onSelected: (value) {
                    //                                 onStateController.value =
                    //                                     ConditionInputStateType
                    //                                         .change;
                    //                               },
                    //                             ),
                    //                         ],
                    //                       );
                    //                     },
                    //                   ),
                    //                 ],
                    //               ),
                    //         ],
                    //       );
                    //     }),
                    Spacer(),
                    const SizedBox(height: 30),
                    Center(
                      child: AppFormButton.primary(
                        onPressed: _submit,
                        child: Text('Добавить'),
                      ),
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

typedef ConditionModalScreenResult = ({
  bool isNew,
  ConditionEntity condition,
});

class ConditionValueForm extends StatelessWidget {
  const ConditionValueForm({
    super.key,
    required this.state,
    required this.parameters,
    required this.stateOperatorController,
    required this.onChanged,
  });

  final DeviceCapabilityStateEntity state;
  final DeviceCapabilityParametersEntity parameters;
  final ValueNotifier<MapEntry<String, ConditionOperator>?>
      stateOperatorController;

  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    late final range;
    try {
      range = (parameters as dynamic).range;
    } catch (e) {
      range = null;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
            animation: stateOperatorController,
            builder: (context, _) {
              return Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (final operator in ConditionOperator.values)
                    ChoiceChip(
                      label: Text(
                        {
                          ConditionOperator.equal: 'Равно',
                          ConditionOperator.notEqual: 'Не равно',
                          ConditionOperator.greaterThan: 'Больше',
                          ConditionOperator.lessThan: 'Меньше',
                        }[operator]!,
                      ),
                      selected: (stateOperatorController.value == null &&
                              operator == ConditionOperator.equal) ||
                          stateOperatorController.value?.value == operator,
                      onSelected: (value) {
                        stateOperatorController.value =
                            MapEntry(state.runtimeType.toString(), operator);
                      },
                    ),
                ],
              );
            }),
        Center(
          child: Text(
            '${(state as dynamic).value.toInt()}${unitToString((parameters as dynamic).unit)}',
            style: context.textTheme.titleMedium,
          ),
        ),
        Slider(
          value: (state as dynamic).value,
          min: range?.min ?? 0,
          max: range?.max ?? 100,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

import 'package:common/common.dart';
import 'package:device_scenarios/src/domain/domain.dart';
import 'package:devices/devices.dart';
import 'package:flutter/cupertino.dart';

class ActionChangeDeviceStateModalScreen extends StatefulWidget {
  const ActionChangeDeviceStateModalScreen({
    super.key,
    required this.device,
  });

  final DeviceEntity device;

  Future<List<ActionEntity>?> show(BuildContext context) {
    return showCupertinoSheet(
      context: context,
      pageBuilder: (context) => this,
    );
  }

  @override
  State<ActionChangeDeviceStateModalScreen> createState() =>
      _ActionChangeDeviceStateModalScreenState();
}

class _ActionChangeDeviceStateModalScreenState
    extends State<ActionChangeDeviceStateModalScreen> {
  late final ValueNotifier<Map<int, DeviceCapabilityStateEntity>>
      _statesController;
  late final Map<int, DeviceCapabilityStateEntity> _availableStates;

  @override
  void initState() {
    super.initState();
    _availableStates = Map.fromEntries([
      for (final capability in widget.device.capabilities)
        if (capability.mapOrNull(onOff: (_) => true) ?? false)
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
                  0)
    ].mapIndexed((index, state) {
      return MapEntry(index, state);
    }));
    _statesController = ValueNotifier({
      _availableStates.entries.first.key: _availableStates.entries.first.value
    });
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  void _submit() {
    final actions = _statesController.value.values.map((state) {
      return ActionEntity.changeDeviceState(
        deviceId: widget.device.id,
        state: state,
      );
    }).toList();
    Navigator.of(context).pop(actions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderTheme(
        data: SliderThemeData(
          padding: EdgeInsets.only(top: 5),
        ),
        child: Padding(
          padding: AppPaddings.horizontal.copyWith(top: 25),
          child: SafeArea(
            top: false,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: ValueListenableBuilder(
                    valueListenable: _statesController,
                    builder: (context, value, child) {
                      return Column(
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
                            'Устройство:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ).reverseMerge(context.textTheme.titleMedium),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.device.name,
                            style: context.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 30),
                          for (final MapEntry(key: index, value: state)
                              in _availableStates.entries) ...[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: IgnorePointer(
                                      ignoring: !_statesController.value
                                          .containsKey(index),
                                      child: Opacity(
                                        opacity: _statesController.value
                                                .containsKey(index)
                                            ? 1.0
                                            : 0.5,
                                        child: (_statesController.value
                                                        .containsKey(index)
                                                    ? _statesController
                                                        .value[index]!
                                                    : state)
                                                .maybeMap(
                                              orElse: () => SizedBox(),
                                              temperature: (state) {
                                                final parameters = widget
                                                    .device.capabilities
                                                    .parametersByType<
                                                        DeviceCapabilityParametersTemperatureEntity>();
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Температура ${state.value.toInt()}${unitToString(parameters.unit)}',
                                                      style: context.textTheme
                                                          .titleMedium,
                                                    ),
                                                    Slider(
                                                      value: state.value,
                                                      min: parameters
                                                              .range?.min ??
                                                          0,
                                                      max: parameters
                                                              .range?.max ??
                                                          100,
                                                      onChanged: (value) {
                                                        _statesController
                                                            .value = {
                                                          for (final entry
                                                              in _statesController
                                                                  .value
                                                                  .entries)
                                                            if (entry.key ==
                                                                index)
                                                              entry.key: DeviceCapabilityStateEntity
                                                                  .temperature(
                                                                      value:
                                                                          value)
                                                            else
                                                              entry.key:
                                                                  entry.value
                                                        };
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                              open: (state) {
                                                final openParameters = widget
                                                    .device.capabilities
                                                    .parametersByType<
                                                        DeviceCapabilityParametersOpenEntity>();
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Открытие ${state.value.toInt()}${unitToString(openParameters.unit)}',
                                                      style: context.textTheme
                                                          .titleMedium,
                                                    ),
                                                    Slider(
                                                        value: state.value,
                                                        min: openParameters
                                                                .range?.min ??
                                                            0,
                                                        max: openParameters
                                                                .range?.max ??
                                                            100,
                                                        onChanged: (value) {
                                                          _statesController
                                                              .value = {
                                                            for (final entry
                                                                in _statesController
                                                                    .value
                                                                    .entries)
                                                              if (entry.key ==
                                                                  index)
                                                                entry.key:
                                                                    DeviceCapabilityStateEntity.open(
                                                                        value:
                                                                            value)
                                                              else
                                                                entry.key:
                                                                    entry.value
                                                          };
                                                        }),
                                                  ],
                                                );
                                              },
                                              on: (state) => PopupMenuButton<
                                                  DeviceCapabilityStateEntity>(
                                                constraints:
                                                    const BoxConstraints(
                                                        maxHeight: 400),
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    value:
                                                        DeviceCapabilityStateEntity
                                                            .on(
                                                      value: null,
                                                    ),
                                                    child: Text(
                                                      'Переключить',
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    value:
                                                        DeviceCapabilityStateEntity
                                                            .on(
                                                      value: true,
                                                    ),
                                                    child: Text(
                                                      'Включить',
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    value:
                                                        DeviceCapabilityStateEntity
                                                            .on(
                                                      value: false,
                                                    ),
                                                    child: Text(
                                                      'Выключить',
                                                    ),
                                                  ),
                                                ],
                                                onSelected: (value) {
                                                  _statesController.value = {
                                                    for (final entry
                                                        in _statesController
                                                            .value.entries)
                                                      if (entry.key == index)
                                                        entry.key: value
                                                      else
                                                        entry.key: entry.value
                                                  };
                                                },
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                    suffixIcon: const Icon(
                                                        Icons.arrow_drop_down),
                                                  ),
                                                  child: Text(
                                                    switch (state.value) {
                                                      null => 'Переключить',
                                                      true => 'Включить',
                                                      false => 'Выключить',
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ) ??
                                            SizedBox(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Checkbox(
                                      value: _statesController.value
                                              .containsKey(index)
                                          ? true
                                          : false,
                                      onChanged: (value) {
                                        if (value == true) {
                                          _statesController.value = {
                                            ..._statesController.value,
                                            index: state,
                                          };
                                        } else {
                                          _statesController.value = {
                                            ..._statesController.value
                                              ..remove(index),
                                          };
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ],
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
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

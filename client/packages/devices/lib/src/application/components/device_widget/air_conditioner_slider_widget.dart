import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

final class AirConditionerSliderWidget extends BaseDeviceWidget {
  const AirConditionerSliderWidget({
    super.key,
    required super.device,
  });

  DeviceCapabilityStateTemperatureEntity? getTemperatureState() {
    return device.capabilities.byTypeOrNull();
  }

  DeviceCapabilityStateOnEntity? getOnState() {
    return device.capabilities.byTypeOrNull();
  }

  DeviceCapabilityParametersTemperatureEntity? getTemperatureParameters() {
    return device.capabilities.parametersByTypeOrNull();
  }

  @override
  Widget buildCapabilitiesAndProperties(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final capability in device.capabilities) ...[
          capability.maybeMap(
            orElse: () => SizedBox(),
            onOff: (capability) {
              if (capability.state == null ||
                  (capability.state as DeviceCapabilityStateOnEntity).value ==
                      null) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: GestureDetector(
                    onTap: () {
                      DevicesScope.of(context).updateDevicesCapabilities(
                        inputs: [
                          (
                            device: device,
                            input: [
                              DeviceCapabilityEntity.onOff(
                                state: DeviceCapabilityStateOnEntity(
                                  value: null,
                                ),
                                parameters: null,
                              ),
                            ],
                          ),
                        ],
                      );
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
                      child: Icon(Icons.power_settings_new),
                    ),
                  ),
                );
              }
              final state = capability.state as DeviceCapabilityStateOnEntity;
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Transform.scale(
                  scale: 0.9,
                  child: Switch(
                    value: state.value!,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) async {
                      DevicesScope.of(context).updateDevicesCapabilities(
                        inputs: [
                          (
                            device: device,
                            input: [
                              DeviceCapabilityEntity.onOff(
                                state: DeviceCapabilityStateEntity.on(
                                  value: value,
                                ),
                                parameters: null,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ],
    );
  }

  @override
  Widget buildBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: RangeWidget(
        capability: device.capabilities.firstWhereOrNull(
          (capability) => capability is DeviceCapabilityRangeEntity,
        ) as DeviceCapabilityRangeEntity?,
        isEnabled: getOnState()?.value ?? false,
        device: device,
      ), // Assuming the first range capability is the temperature
    );
  }
}

class RangeWidget extends StatelessWidget {
  const RangeWidget({
    super.key,
    required this.isEnabled,
    required this.device,
    required this.capability,
    this.flexWeights = const [1, 2, 1],
  });

  final DeviceEntity device;
  final bool isEnabled;
  final DeviceCapabilityRangeEntity? capability;
  final List<int> flexWeights;

  @override
  Widget build(BuildContext context) {
    return UpdateValueIfPointerUpWidget(
      value: capability?.state,
      onNeedUpdate: (state) {
        DevicesScope.of(context).updateDevicesCapabilities(
          inputs: [
            (
              device: device,
              input: [
                DeviceCapabilityEntity.range(
                  state: state,
                  parameters: null,
                ),
              ],
            ),
          ],
        );
      },
      builder: (context, state, setValue) {
        final parameters = capability?.parameters as dynamic;

        void onChanged(double value) {
          setValue(switch (capability?.parameters) {
            DeviceCapabilityParametersChannelEntity _ =>
              DeviceCapabilityStateChannelEntity(
                value: value.toDouble(),
              ),
            DeviceCapabilityParametersVolumeEntity _ =>
              DeviceCapabilityStateVolumeEntity(
                value: value.toDouble(),
              ),
            _ => (state as dynamic).copyWith(
                value: value.toDouble(),
              ),
          });
        }

        if (parameters?.unit == DeviceUnit.percent) {
          return AppSlider(
            value: (state as dynamic)?.value ?? parameters.range?.min ?? 0,
            min: parameters.range?.min,
            max: parameters.range?.max,
            precision: parameters.range?.precision,
            onChanged: onChanged,
          );
        }

        return CarouselSelectWidget(
          isEnabled: isEnabled,
          flexWeights: flexWeights,
          min: (parameters?.range?.min ?? 0).toInt(),
          max: (parameters?.range?.max ?? 100.0).toInt(),
          initialValue: ((state as dynamic)?.value.toDouble() ??
                  parameters?.range?.min ??
                  0)
              .toInt(),
          union: switch (parameters?.unit) {
            DeviceUnit unit => unitToString(unit),
            _ => null,
          },
          onChanged: (int value) => onChanged(value.toDouble()),
        );
      },
    );
  }
}

class CarouselSelectWidget extends StatefulWidget {
  const CarouselSelectWidget({
    super.key,
    required this.isEnabled,
    required this.min,
    required this.max,
    required this.initialValue,
    required this.onChanged,
    this.flexWeights = const [1, 2, 1],
    this.union,
  });

  final bool isEnabled;
  final int min;
  final int max;
  final int initialValue;
  final void Function(int value) onChanged;
  final String? union;
  final List<int> flexWeights;

  @override
  State<CarouselSelectWidget> createState() => _CarouselSelectWidgetState();
}

class _CarouselSelectWidgetState extends State<CarouselSelectWidget> {
  late final CarouselController _controller;
  late final List<int> _items;
  late int currentValue;
  double? itemExtent;

  @override
  void initState() {
    super.initState();
    _items = List.generate(
      widget.max - widget.min + 1,
      (index) => index + widget.min,
    );
    _controller = CarouselController(
      initialItem: _items.indexOf(widget.initialValue),
    );
    currentValue = widget.initialValue;

    _controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    final index = _controller.offset ~/ itemExtent!;
    if (index < 0 || index >= _items.length) return;
    final newValue = _items[index];

    if (newValue != currentValue) {
      currentValue = newValue;
      widget.onChanged(newValue);
    }
  }

  @override
  void didUpdateWidget(covariant CarouselSelectWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      if (widget.initialValue == currentValue) return;
      currentValue = widget.initialValue;
      _controller.animateToItem(_items.indexOf(widget.initialValue));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          LayoutBuilder(builder: (context, csTop) {
            itemExtent ??=
                csTop.maxWidth / (widget.flexWeights.fold(0, (a, b) => a + b));
            return CarouselView.weighted(
              backgroundColor: Colors.transparent,
              itemSnapping: true,
              padding: EdgeInsets.symmetric(horizontal: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              controller: _controller,
              flexWeights: widget.flexWeights,
              onTap: (index) => _controller.animateToItem(
                index,
                duration: const Duration(milliseconds: 300),
              ),
              children: [
                for (final item in _items)
                  Center(
                    child: LayoutBuilder(
                      builder: (context, cs) {
                        final isSelected = cs.maxWidth > itemExtent!;
                        return FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '$item${widget.union ?? ''}',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: isSelected
                                  ? context.theme.primaryColorLight
                                  : context.theme.colorScheme.onSurface,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          }),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:devices/devices.dart' hide HSVColor;
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart' hide HSVColor;
import 'package:rooms/rooms.dart';

class DeviceScreen extends StatefulWidget with ScreenMixin {
  const DeviceScreen({
    super.key,
    required this.heroTag,
  });

  final String heroTag;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  IconData getBatteryIcon(
      DeviceCapabilityStateBatteryLevelEntity? batteryLevelState) {
    if (batteryLevelState == null) return Icons.battery_unknown;
    if (batteryLevelState.value >= 97) return Icons.battery_full;
    if (batteryLevelState.value >= 90) return Icons.battery_5_bar_rounded;
    if (batteryLevelState.value >= 75) return Icons.battery_4_bar_rounded;
    if (batteryLevelState.value >= 50) return Icons.battery_3_bar_rounded;
    if (batteryLevelState.value >= 25) return Icons.battery_2_bar_rounded;
    return Icons.battery_1_bar_rounded;
  }

  Color getBatteryColor(
      DeviceCapabilityStateBatteryLevelEntity? batteryLevelState) {
    if (batteryLevelState == null) return Colors.grey;
    if (batteryLevelState.value >= 90) return Colors.green;
    if (batteryLevelState.value >= 60) return Colors.lightGreen;
    if (batteryLevelState.value >= 40) return Colors.yellow;
    if (batteryLevelState.value >= 20) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final device = DeviceScope.of(context, listen: true).state.data!;
    // final state = YandexSignInScope.of(context, listen: true).state;

    final batteryLevelState = device.properties
        .byTypeOrNull<DeviceCapabilityStateBatteryLevelEntity>();

    final scaleSize = context.read<double>();
    return Hero(
      tag: widget.heroTag,
      transitionOnUserGestures: true,
      flightShuttleBuilder: (
        flightContext,
        animation,
        direction,
        fromContext,
        toContext,
      ) {
        final Hero toHero = toContext.widget as Hero;
        final Hero fromHero = fromContext.widget as Hero;

        return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final t = Curves.ease.transform(animation.value);
              return t < 0.3 && scaleSize > 0.8
                  ? Transform.scale(
                      scale: scaleSize,
                      child: (direction == HeroFlightDirection.push)
                          ? fromHero.child
                          : toHero.child,
                    )
                  : _DeviceScreenScaffold(
                      key: ValueKey('device_screen_scaffold_hero'),
                      device: device,
                      batteryLevelState: batteryLevelState,
                      animateValue: 0.3 + (1 - 0.3) * t,
                      backgroundColor: Color.lerp(
                        Color(0xFF6F6F6F),
                        context.theme.colorScheme.surface,
                        t,
                      ),
                    );
            });
      },
      child: _DeviceScreenScaffold(
        device: device,
        batteryLevelState: batteryLevelState,
        animateValue: 1.0,
      ),
    );
  }
}

class _DeviceScreenScaffold extends StatelessWidget {
  const _DeviceScreenScaffold({
    super.key,
    required this.device,
    required this.batteryLevelState,
    required this.animateValue,
    this.backgroundColor,
  });

  final DeviceEntity device;
  final DeviceCapabilityStateBatteryLevelEntity? batteryLevelState;
  final double animateValue;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: backgroundColor ?? context.theme.colorScheme.surface,
          child: Column(
            children: [
              AnimatedOpacity(
                opacity: animateValue >= 0.95 ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: Padding(
                  padding:
                      EdgeInsetsGeometry.only(top: 10, left: 10, right: 10),
                  child: SizedBox(
                    height: 47 * (0.4 + (1 - 0.4) * animateValue),
                    width: double.infinity,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              context.rootContext.navigator.popForced(),
                          icon: const Icon(Icons.close),
                        ),
                        if (device.providerType == DeviceProviderType.hikvision)
                          Expanded(
                            child: Center(
                              child: AutoSizeText(
                                device.name,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.bold)
                                    .reverseMerge(
                                        context.textTheme.headlineSmall),
                              ),
                            ),
                          )
                        else
                          Spacer(),
                        IconButton(
                          onPressed: () => context.navigator.pushRoute('/edit'),
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: AppPaddings.horizontal,
                  physics: ClampingScrollPhysics(),
                  controller: ModalScrollController.of(context),
                  children: switch (device.type) {
                    DeviceType.doorWithLock => [
                        DoorWithLockDeviceBody(device: device),
                      ],
                    DeviceType.cameraHub => [
                        CameraHubDeviceBody(device: device),
                      ],
                    DeviceType.camera => [
                        CameraDeviceBody(device: device),
                      ],
                    _ => [
                        Transform.scale(
                          scale: animateValue,
                          alignment: Alignment.topLeft,
                          child: (checkDeviceIsOff(device))
                              ? getIconsByDeviceType(type: device.type)
                                  .iconOff
                                  .svg(
                                    width: 150,
                                    height: 150,
                                  )
                              : getIconsByDeviceType(type: device.type)
                                  .icon
                                  .svg(
                                    width: 150,
                                    height: 150,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        AnimatedOpacity(
                          opacity: animateValue >= 0.95 ? 1 : 0,
                          duration: const Duration(milliseconds: 400),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                RoomsScope.of(context)
                                        .state
                                        .data
                                        ?.firstWhereOrNull(
                                          (room) => room.id == device.roomId,
                                        )
                                        ?.name ??
                                    '-',
                                style: context.textTheme.titleMedium,
                              ),
                              const SizedBox(width: 8),
                              if (batteryLevelState != null) ...[
                                Icon(
                                  _DeviceScreenState()
                                      .getBatteryIcon(batteryLevelState),
                                  color: _DeviceScreenState()
                                      .getBatteryColor(batteryLevelState),
                                ),
                                Text(
                                  '${batteryLevelState!.value.toInt()}%',
                                  style: context.textTheme.titleMedium,
                                ),
                              ]
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: AutoSizeText(
                            device.name,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TextStyle(fontWeight: FontWeight.bold)
                                .reverseMerge(context.textTheme.headlineSmall),
                          ),
                        ),
                        if (device.type == DeviceType.controlBoxHub) ...[
                          ControlBoxHubDeviceBody(device: device),
                        ] else ...[
                          _CapabilitiesSection(device: device),
                          _RangesSection(device: device),
                          _PropertiesSection(device: device),
                        ],
                      ],
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CapabilitiesSection extends StatelessWidget {
  const _CapabilitiesSection({required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        for (final capability in device.capabilities) ...[
          capability.maybeMap(
            orElse: () => SizedBox(),
            onOff: (capability) => _OnOffCapability(
              capability: capability,
              device: device,
            ),
          ),
        ],
        for (final property in device.properties) ...[
          if (property is DevicePropertyEventEntity &&
              property.state?['instance'] == 'button') ...[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: SensorPowerButton(
                device: device,
              ),
            ),
            if (property.parameters?['events'] is List &&
                (property.parameters?['events'] as List)
                        .firstWhereOrNull((e) => e['value'] == 'click_2') !=
                    null) ...[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: SensorPowerButton(
                  device: device,
                  buttonNumber: 2,
                ),
              ),
            ],
          ]
        ],
      ].where((w) => w is! SizedBox).toList(),
    );
  }
}

class _RangesSection extends StatelessWidget {
  const _RangesSection({required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final capability in device.capabilities)
          capability.maybeMap(
            orElse: () => SizedBox(),
            colorSetting: (capability) => _ColorSettingCapability(
              capability: capability,
              device: device,
            ),
            range: (capability) => Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  Text(switch (capability.parameters) {
                    DeviceCapabilityParametersChannelEntity _ => 'Канал',
                    DeviceCapabilityParametersBrightnessEntity _ => 'Яркость',
                    DeviceCapabilityParametersOpenEntity _ => 'Открытие',
                    DeviceCapabilityParametersHumidityEntity _ => 'Влажность',
                    DeviceCapabilityParametersTemperatureEntity _ =>
                      'Температура',
                    DeviceCapabilityParametersWorkSpeedEntity _ =>
                      'Скорость работы',
                    DeviceCapabilityParametersVolumeEntity _ => 'Громкость',
                    _ => '',
                  }),
                  const SizedBox(height: 8),
                  RangeWidget(
                    isEnabled: true,
                    capability: capability,
                    flexWeights: const [1, 1, 2, 1, 1],
                    device: device,
                  ),
                ],
              ),
            ),
          ),
      ].where((w) => w is! SizedBox).toList(),
    );
  }
}

class _PropertiesSection extends StatelessWidget {
  const _PropertiesSection({required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final property in device.properties)
          property.maybeMap(
            orElse: () => SizedBox(),
            event: (property) {
              if (property.state?['instance'] == 'open') {
                return _OpenEventInfo(state: property.state!);
              }
              if (property.state?['instance'] == 'motion') {
                return _MotionEventInfo(state: property.state!);
              }
              if (property.state?['instance'] == 'smoke') {
                return _SmokeEventInfo(state: property.state!);
              }
              if (property.state?['instance'] == 'water_leak') {
                return _WaterLeakEventInfo(state: property.state!);
              }
              if (property.state?['instance'] == 'vibration') {
                return _VibrationEventInfo(state: property.state!);
              }
              return SizedBox();
            },
            float: (property) =>
                property.state?.maybeMap(
                  orElse: () => SizedBox(),
                  temperature: (state) => _TemperatureInfo(
                    state: state,
                    parameters: property.parameters
                        as DeviceCapabilityParametersTemperatureEntity,
                  ),
                  humidity: (state) => _HumidityInfo(
                    state: state,
                    parameters: property.parameters
                        as DeviceCapabilityParametersHumidityEntity,
                  ),
                ) ??
                SizedBox(),
          ),
      ].where((w) => w is! SizedBox).toList(),
    );
  }
}

class _TemperatureInfo extends StatelessWidget {
  const _TemperatureInfo({
    required this.state,
    required this.parameters,
  });

  final DeviceCapabilityStateTemperatureEntity state;
  final DeviceCapabilityParametersTemperatureEntity parameters;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Температура',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            '${state.value.toInt()}${unitToString(parameters.unit)}',
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600)
                .reverseMerge(context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _HumidityInfo extends StatelessWidget {
  const _HumidityInfo({
    required this.state,
    required this.parameters,
  });

  final DeviceCapabilityStateHumidityEntity state;
  final DeviceCapabilityParametersHumidityEntity parameters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Влажность',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            '${state.value.toInt()}${unitToString(parameters.unit)}',
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600)
                .reverseMerge(context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _OpenEventInfo extends StatelessWidget {
  const _OpenEventInfo({
    required this.state,
  });

  final Map<String, dynamic> state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Состояние открытия',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            switch (state['value']) {
              'opened' => 'Открыто',
              'closed' => 'Закрыто',
              _ => 'Неизвестно',
            },
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600)
                .reverseMerge(context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _MotionEventInfo extends StatelessWidget {
  const _MotionEventInfo({
    required this.state,
  });

  final Map<String, dynamic> state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Состояние движения',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            switch (state['value']) {
              'detected' => 'Движение',
              'not_detected' => 'Нет движения',
              _ => 'Неизвестно',
            },
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600)
                .reverseMerge(context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _SmokeEventInfo extends StatelessWidget {
  const _SmokeEventInfo({
    required this.state,
  });

  final Map<String, dynamic> state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Состояние дыма',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            switch (state['value']) {
              'detected' => 'Дым обнаружен',
              'not_detected' => 'Нет дыма',
              _ => 'Неизвестно',
            },
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600)
                .reverseMerge(context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _WaterLeakEventInfo extends StatelessWidget {
  const _WaterLeakEventInfo({
    required this.state,
  });

  final Map<String, dynamic> state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Состояние протечки',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            switch (state['value']) {
              'leak' => 'Протечка обнаружена',
              'dry' => 'Нет протечки',
              _ => 'Неизвестно',
            },
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600)
                .reverseMerge(context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _VibrationEventInfo extends StatelessWidget {
  const _VibrationEventInfo({
    required this.state,
  });

  final Map<String, dynamic> state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Состояние вибрации',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            switch (state['value']) {
              'vibration' => 'Вибрация обнаружена',
              'fall' => 'Падение обнаружено',
              'tilt' => 'Нет вибрации',
              _ => 'Неизвестно',
            },
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600)
                .reverseMerge(context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _OnOffCapability extends StatelessWidget {
  const _OnOffCapability({
    required this.capability,
    required this.device,
  });

  final DeviceEntity device;
  final DeviceCapabilityOnOffEntity capability;
  @override
  Widget build(BuildContext context) {
    if (capability.state == null ||
        (capability.state as DeviceCapabilityStateOnEntity).value == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: PowerButton(
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
        ),
      );
    }
    final state = capability.state as DeviceCapabilityStateOnEntity;
    return Transform.scale(
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
    );
  }
}

class _ColorSettingCapability extends StatelessWidget {
  const _ColorSettingCapability({
    required this.capability,
    required this.device,
  });

  final DeviceEntity device;
  final DeviceCapabilityColorSettingEntity capability;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Text(
            'Цвет',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          switch (capability.state) {
            DeviceCapabilityStateHsvEntity state => ColorPicker(
                pickerColor: HSVColor.fromAHSV(1, state.value.h.toDouble(),
                        state.value.s / 100, state.value.v / 100)
                    .toColor(),
                onColorChanged: (color) {
                  final hsvColor = HSVColor.fromColor(color);
                  DevicesScope.of(context).updateDevicesCapabilities(
                    inputs: [
                      (
                        device: device,
                        input: [
                          DeviceCapabilityEntity.colorSetting(
                            state: DeviceCapabilityStateEntity.hsv(
                              value: (
                                h: hsvColor.hue.toInt(),
                                s: (hsvColor.saturation * 100).toInt(),
                                v: (hsvColor.value * 100).toInt()
                              ),
                            ),
                            parameters: null,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            DeviceCapabilityStateRgbEntity state => ColorPicker(
                // state.value is 24bit ARGB need convert to Color 32bit ARGB
                pickerColor: Color(state.value | 0xFF000000),
                onColorChanged: (color) {
                  DevicesScope.of(context).updateDevicesCapabilities(
                    inputs: [
                      (
                        device: device,
                        input: [
                          DeviceCapabilityEntity.colorSetting(
                            state: DeviceCapabilityStateEntity.rgb(
                              value: color.toARGB32() & 0x00FFFFFF,
                            ),
                            parameters: null,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            _ => SizedBox(),
          },
        ],
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
  });

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;

  // Проверка похожести цветов (по евклидову расстоянию в RGB)
  static bool _isColorSimilar(Color a, Color b, {int tolerance = 24}) {
    // ignore: deprecated_member_use
    final dr = a.red - b.red;
    // ignore: deprecated_member_use
    final dg = a.green - b.green;
    // ignore: deprecated_member_use
    final db = a.blue - b.blue;
    return (dr * dr + dg * dg + db * db) <= tolerance * tolerance;
  }

  @override
  Widget build(BuildContext context) {
    // 1, 261, 0.68, 0.71
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final color in {
          Colors.white,
          const Color.fromARGB(255, 255, 17, 0),
          const Color.fromARGB(255, 255, 46, 116),
          Colors.purple,
          Colors.deepPurple,
          Colors.indigo,
          Colors.blue,
          Colors.lightBlue,
          Colors.cyan,
          Colors.teal,
          Colors.green,
          Colors.lightGreen,
          Colors.lime,
          Colors.yellow,
          Colors.amber,
          Colors.orange,
          Colors.deepOrange,
          Colors.brown,
          Colors.grey,
          Colors.blueGrey,
          Colors.black,
        })
          GestureDetector(
            onTap: () => onColorChanged(color),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorPicker._isColorSimilar(pickerColor, color)
                      ? context.theme.colorScheme.onPrimary
                      : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

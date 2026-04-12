import 'dart:math';

import 'package:common/common.dart';
import 'package:device_positions/device_positions.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/application.dart';
import 'package:flutter_svg/svg.dart';

class DeviceOnFloorLayout extends StatelessWidget {
  const DeviceOnFloorLayout({
    super.key,
    required this.device,
    required this.position,
  });

  final DeviceEntity device;
  final DevicePositionEntity position;

  @override
  Widget build(BuildContext context) {
    return switch (device.type) {
      DeviceType.light => _Light(device: device, position: position),
      DeviceType.openableCurtain => _Curtain(device: device),
      DeviceType.thermostatAc => _AirConditioner(device: device),
      _ => SizedBox(),
    };
  }
}

class _Curtain extends StatelessWidget {
  const _Curtain({
    required this.device,
  });

  final DeviceEntity device;

  DeviceCapabilityStateOpenEntity getOpenState() {
    return device.capabilities.byType();
  }

  DeviceCapabilityParametersOpenEntity getOpenParameters() {
    return device.capabilities.parametersByType();
  }

  @override
  Widget build(BuildContext context) {
    return UpdateValueIfPointerUpWidget(
      value: getOpenState(),
      onNeedUpdate: (openState) {
        DevicesScope.of(context).updateDevicesCapabilities(
          inputs: [
            (
              device: device,
              input: [
                DeviceCapabilityEntity.range(
                  state: openState,
                  parameters: null,
                ),
              ],
            ),
          ],
        );
      },
      builder: (context, openState, setValue) {
        return Column(
          children: [
            Text(device.name),
            const SizedBox(height: 4),
            Text(
              'Открыто ~ ${openState.value.toInt()}%',
              style: const TextStyle(
                color: Color(0xFFD9D9D9),
              ).reverseMerge(context.textTheme.labelMedium),
            ),
            Transform.scale(
              scale: .7,
              child: AppSlider(
                value: openState.value,
                min: getOpenParameters().range?.min,
                max: getOpenParameters().range?.max,
                precision: getOpenParameters().range?.precision,
                onChanged: (value) =>
                    setValue(openState.copyWith(value: value)),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Light extends StatelessWidget {
  const _Light({
    required this.device,
    required this.position,
  });

  final DeviceEntity device;
  final DevicePositionEntity position;

  DeviceCapabilityStateOnEntity getOnState() {
    return device.capabilities.byType();
  }

  @override
  Widget build(BuildContext context) {
    return _LightIcon(
      iconPath: position.iconMediaPath,
      disabledIconPath: position.disabledIconMediaPath,
      isActive: getOnState().value!,
      onChanged: (value) {
        DevicesScope.of(context).updateDevicesCapabilities(
          inputs: [
            (
              device: device,
              input: [
                DeviceCapabilityEntity.onOff(
                  state: DeviceCapabilityStateOnEntity(
                    value: value,
                  ),
                  parameters: null,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _LightIcon extends StatelessWidget {
  const _LightIcon({
    this.isActive = true,
    // ignore: unused_element, unused_element_parameter
    this.reversed = false,
    required this.onChanged,
    this.iconPath,
    this.disabledIconPath,
  });

  final bool isActive;
  final ValueChanged<bool> onChanged;
  final bool reversed;
  final String? iconPath;
  final String? disabledIconPath;

  String getFullUrl(BuildContext context, String path) {
    return context.read<IAppConfig>().baseUrl + path;
  }

  //
  @override
  Widget build(BuildContext context) {
    final icon = InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        onChanged(!isActive);
      },
      child: switch (iconPath) {
        String iconPath => switch (disabledIconPath) {
            String disabledIconPath => isActive
                ? SvgPicture.network(
                    getFullUrl(context, iconPath),
                  )
                : SvgPicture.network(
                    getFullUrl(context, disabledIconPath),
                  ),
            null => isActive
                ? SvgPicture.network(
                    getFullUrl(context, iconPath),
                  )
                : SvgPicture.network(
                    getFullUrl(context, iconPath),
                    colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 198, 198, 198),
                      BlendMode.srcIn,
                    ),
                  ),
          },
        null => SizedBox(
            width: 30,
            height: 30,
            child: Center(
              child: Assets.icons.light.svg(
                  colorFilter: switch (isActive) {
                false => const ColorFilter.mode(
                    Color.fromARGB(255, 198, 198, 198),
                    BlendMode.srcIn,
                  ),
                true => null,
              }),
            ),
          )
      },
    );
    if (reversed) {
      return Transform.rotate(
        angle: pi,
        child: icon,
      );
    }
    return icon;
  }
}

class _AirConditioner extends StatelessWidget {
  const _AirConditioner({
    required this.device,
  });

  final DeviceEntity device;

  DeviceCapabilityStateTemperatureEntity getTemperatureState() {
    return device.capabilities.byType();
  }

  DeviceCapabilityStateOnEntity getOnState() {
    return device.capabilities.byType();
  }

  @override
  Widget build(BuildContext context) {
    return UpdateValueIfPointerUpWidget(
        value: getTemperatureState(),
        onNeedUpdate: (tempState) {
          DevicesScope.of(context).updateDevicesCapabilities(
            inputs: [
              (
                device: device,
                input: [
                  DeviceCapabilityEntity.range(
                    state: tempState,
                    parameters: null,
                  ),
                ],
              ),
            ],
          );
        },
        builder: (context, tempState, setValue) {
          return Column(
            children: [
              const Text('Кондиционер'),
              const SizedBox(height: 4),
              Text(
                '+${tempState.value.toInt()}°C',
                style: const TextStyle(
                  color: Color(0xFFD9D9D9),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -9),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => setValue(tempState.copyWith(
                        value: max(tempState.value - 1, 0),
                      )),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.theme.colorScheme.onSurface,
                        minimumSize: const Size(26, 26),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => setValue(
                        tempState.copyWith(
                          value: min(tempState.value + 1, 30),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.theme.colorScheme.onSurface,
                        minimumSize: const Size(26, 26),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

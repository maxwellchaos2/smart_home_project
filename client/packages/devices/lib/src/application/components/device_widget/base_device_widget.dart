import 'package:common/common.dart';
import 'package:devices/devices.dart' hide HSVColor;
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart' hide HSVColor;
import 'package:rooms/rooms.dart';

abstract class BaseDeviceWidget extends StatelessWidget {
  const BaseDeviceWidget({
    super.key,
    required this.device,
    this.iconSize = 45,
  });

  final DeviceEntity device;
  final double iconSize;

  Widget buildIcon(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: (checkDeviceIsOff(device))
                ? getIconsByDeviceType(type: device.type).iconOff.svg(
                      width: iconSize,
                      height: iconSize,
                    )
                : getIconsByDeviceType(type: device.type).icon.svg(
                      width: iconSize,
                      height: iconSize,
                    ),
          ),
        ),
        if (device.status == DeviceStatus.offline &&
            device.providerType != DeviceProviderType.yandex) ...[
          Positioned(
            right: -4,
            bottom: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.cloud_off,
                size: iconSize / 3,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget buildName(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 60,
      ),
      child: AutoSizeText(
        device.name,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.titleMedium,
      ),
    );
  }

  Widget buildRoomName(BuildContext context) {
    final roomName = RoomsScope.of(context)
        .state
        .data
        ?.firstWhereOrNull(
          (room) => room.id == device.roomId,
        )
        ?.name;
    if (roomName == null) {
      return SizedBox();
    }
    return AutoSizeText(
      roomName,
      maxLines: 1,
      minFontSize: 8,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.labelMedium?.copyWith(
        color: Colors.white70,
        fontSize: 12,
      ),
    );
  }

  Widget buildCapabilitiesAndProperties(BuildContext context) {
    final capabilitiesSorted = device.capabilities.sortedByCompare(
      (capability) => capability.map(
        onOff: (_) => 0,
        colorSetting: (_) => 1,
        range: (_) => 2,
        mode: (_) => 3,
        float: (_) => 4,
        unknown: (_) => 5,
      ),
      (a, b) => a.compareTo(b),
    );
    return Row(
      children: [
        for (final capability in capabilitiesSorted) ...[
          capability.maybeMap(
            orElse: () => SizedBox(),
            colorSetting: (capability) =>
                _ColorSettingCapability(capability: capability),
            onOff: (capability) {
              if (capability.state == null ||
                  (capability.state as DeviceCapabilityStateOnEntity).value ==
                      null) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
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
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Transform.scale(
                  scale: 0.9,
                  child: Switch(
                    value: state.value!,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) async {
                      // TODO: delete it
                      // if (device.id == 36 && value == true) {
                      //   final message = (
                      //     title: 'Обнаружена протечка!',
                      //     message:
                      //         'Внимание! В системе обнаружена протечка воды. Пожалуйста, проверьте все краны и сантехнику.',
                      //   );
                      //   await WarningDialog(
                      //     title: message.title,
                      //     message: message.message,
                      //   ).show(context);
                      //   context
                      //       .read<WarningController>()
                      //       .setMessage(message);
                      // } else if (device.id == 36 && value == false) {
                      //   context.read<WarningController>().clearMessage();
                      // }
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
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
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
                                .firstWhereOrNull(
                                    (e) => e['value'] == 'click_2') !=
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
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget? buildBottom(BuildContext context) {
    return null;
  }

  Widget containerWrapper({required Widget child}) {
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          .copyWith(right: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF6F6F6F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = buildBottom(context);
    return containerWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              buildIcon(context),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: buildName(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: buildRoomName(context),
                    ),
                    buildCapabilitiesAndProperties(context),
                  ],
                ),
              ),
            ],
          ),
          if (bottom != null) bottom,
        ],
      ),
    );
  }
}

class _ColorSettingCapability extends StatelessWidget {
  const _ColorSettingCapability({
    required this.capability,
  });

  final DeviceCapabilityColorSettingEntity capability;
  @override
  Widget build(BuildContext context) {
    final color = switch (capability.state) {
      DeviceCapabilityStateHsvEntity state => HSVColor.fromAHSV(
              1,
              state.value.h.toDouble(),
              state.value.s / 100,
              state.value.v / 100)
          .toColor(),
      DeviceCapabilityStateRgbEntity state => Color(state.value | 0xFF000000),
      _ => Colors.transparent,
    };
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          color: color,
        ),
      ),
    );
  }
}

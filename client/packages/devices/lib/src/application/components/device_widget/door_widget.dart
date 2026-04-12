import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

final class DoorWidget extends BaseDeviceWidget {
  const DoorWidget({
    super.key,
    required super.device,
  });

  @override
  Widget buildIcon(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: iconSize,
          child: (checkDeviceIsOff(device))
              ? getIconsByDeviceType(type: device.type).iconOff.svg(
                    width: iconSize,
                  )
              : getIconsByDeviceType(type: device.type).icon.svg(
                    width: iconSize,
                  ),
        ),
        if (device.status == DeviceStatus.offline) ...[
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

  @override
  Widget buildCapabilitiesAndProperties(BuildContext context) {
    return Column(
      children: [
        for (final property in device.properties) ...[
          if (property is DevicePropertyEventEntity &&
              property.state?['instance'] == 'open')
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  switch (property.state?['value']) {
                    'opened' => 'Открыта',
                    'closed' => 'Закрыта',
                    _ => 'Неизвестно',
                  },
                  maxLines: 1,
                  style: const TextStyle(
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
        ],
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              for (final capability in device.capabilities) ...[
                if (capability.state is DeviceCapabilityStateOnEntity) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8),
                    child: LockButton(
                      value: (capability.state as DeviceCapabilityStateOnEntity)
                          .value!,
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
                    ),
                  )
                ]
              ]
            ],
          ),
        ),
      ],
    );
  }
}

class LockButton extends StatelessWidget {
  const LockButton({
    super.key,
    this.onChanged,
    required this.value,
    this.size = 40,
  });

  final ValueChanged<bool>? onChanged;
  final bool value;
  final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: Container(
          width: size + 10,
          height: size,
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
          child: value
              ? Assets.icons.lockOpen.svg(
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.orangeAccent,
                    BlendMode.srcIn,
                  ),
                )
              : Assets.icons.lock.svg(
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8),
                    BlendMode.srcIn,
                  ),
                )),
    );
  }
}

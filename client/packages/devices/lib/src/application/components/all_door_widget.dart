import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

class AllDoorWidgetWidget extends StatelessWidget {
  const AllDoorWidgetWidget({
    super.key,
    this.filter,
  });

  final bool Function(DeviceEntity)? filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          .copyWith(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF6F6F6F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF4A4A4A),
          width: 5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DevicesBlocBuilder(
                  filter: (device) =>
                      [
                        DeviceType.doorWithLock,
                      ].contains(device.type) &&
                      (filter?.call(device) ?? true),
                  builder: (context, data) {
                    return Transform.translate(
                      offset: Offset(-5, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 10,
                            top: 0,
                            child: getIconsByDeviceType(
                                    type: DeviceType.doorWithLock)
                                .iconOff
                                .svg(
                                  width: 45,
                                  height: 45,
                                ),
                          ),
                          Positioned(
                            left: 5,
                            top: 0,
                            child: getIconsByDeviceType(
                                    type: DeviceType.doorWithLock)
                                .iconOff
                                .svg(
                                  width: 45,
                                  height: 45,
                                ),
                          ),
                          getIconsByDeviceType(type: DeviceType.doorWithLock)
                              .iconOff
                              .svg(
                                width: 45,
                                height: 45,
                              ),
                        ],
                      ),
                    );
                  }),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Вcе двери',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: DevicesBlocBuilder(
                          filter: (device) =>
                              [
                                DeviceType.doorWithLock,
                              ].contains(device.type) &&
                              (filter?.call(device) ?? true),
                          builder: (context, data) {
                            return Row(
                              children: [
                                LockButton(
                                  value: true,
                                  onChanged: (_) {
                                    DevicesScope.of(context)
                                        .updateDevicesCapabilities(
                                      inputs: [
                                        for (final device in data)
                                          (
                                            device: device,
                                            input: [
                                              DeviceCapabilityEntity.onOff(
                                                state:
                                                    DeviceCapabilityStateEntity
                                                        .on(
                                                  value: true,
                                                ),
                                                parameters: null,
                                              ),
                                            ],
                                          ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(width: 8),
                                LockButton(
                                  value: false,
                                  onChanged: (_) {
                                    DevicesScope.of(context)
                                        .updateDevicesCapabilities(
                                      inputs: [
                                        for (final device in data)
                                          (
                                            device: device,
                                            input: [
                                              DeviceCapabilityEntity.onOff(
                                                state:
                                                    DeviceCapabilityStateEntity
                                                        .on(
                                                  value: false,
                                                ),
                                                parameters: null,
                                              ),
                                            ],
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

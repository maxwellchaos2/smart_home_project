import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

class LightSmallWidget extends StatelessWidget {
  const LightSmallWidget({
    super.key,
    this.filter,
  });

  final bool Function(DeviceEntity)? filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          .copyWith(right: 20),
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
                        DeviceType.light,
                        DeviceType.lightCeiling,
                        DeviceType.lightStrip,
                        DeviceType.lightLamp
                      ].contains(device.type) &&
                      (filter?.call(device) ?? true),
                  builder: (context, data) {
                    final isOn = data.any((element) =>
                        element.capabilities
                            .byTypeOrNull<DeviceCapabilityStateOnEntity>()
                            ?.value ??
                        false);
                    return (isOn
                            ? Assets.icons.devices.light
                            : Assets.icons.devices.lightOff)
                        .svg(
                      width: 45,
                      height: 45,
                    );
                  }),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Весь свет',
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.9,
                    child: AllLightSwitch(
                      filter: filter,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AllLightSwitch extends StatelessWidget {
  const AllLightSwitch({
    super.key,
    this.filter,
  });

  final bool Function(DeviceEntity)? filter;

  @override
  Widget build(BuildContext context) {
    return DevicesBlocBuilder(
      filter: (device) =>
          [
            DeviceType.light,
            DeviceType.lightCeiling,
            DeviceType.lightStrip,
            DeviceType.lightLamp,
          ].contains(device.type) &&
          (filter?.call(device) ?? true),
      builder: (context, data) {
        return Switch(
          value: data.any((element) =>
              element.capabilities
                  .byTypeOrNull<DeviceCapabilityStateOnEntity>()
                  ?.value ??
              false),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            if (value) {
              DevicesScope.of(context).updateDevicesCapabilities(inputs: [
                for (final device in data)
                  (
                    device: device,
                    input: [
                      DeviceCapabilityEntity.onOff(
                        state: DeviceCapabilityStateEntity.on(
                          value: true,
                        ),
                        parameters: null,
                      ),
                    ],
                  ),
              ]);
            } else {
              DevicesScope.of(context).updateDevicesCapabilities(
                inputs: [
                  for (final device in data)
                    (
                      device: device,
                      input: [
                        DeviceCapabilityEntity.onOff(
                          state: DeviceCapabilityStateEntity.on(
                            value: false,
                          ),
                          parameters: null,
                        ),
                      ],
                    ),
                ],
              );
            }
          },
        );
      },
    );
  }
}

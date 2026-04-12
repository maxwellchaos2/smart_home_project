import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

class AllCurtainsWidgetWidget extends StatelessWidget {
  const AllCurtainsWidgetWidget({
    super.key,
    this.filter,
  });

  final bool Function(DeviceEntity)? filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                        DeviceType.openableCurtain,
                      ].contains(device.type) &&
                      (filter?.call(device) ?? true),
                  builder: (context, data) {
                    final isOpen = data.any((element) =>
                        element.capabilities
                            .byTypeOrNull<DeviceCapabilityStateOpenEntity>()
                            ?.value ==
                        100);
                    return (isOpen
                            ? Assets.icons.devices.openableCurtain
                            : Assets.icons.devices.openableCurtainOff)
                        .svg(
                      width: 45,
                      height: 45,
                    );
                  }),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Вcе шторы',
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          DevicesBlocBuilder(
              filter: (device) =>
                  [
                    DeviceType.openableCurtain,
                  ].contains(device.type) &&
                  (filter?.call(device) ?? true),
              builder: (context, data) {
                void setValue(DeviceCapabilityStateOpenEntity value) {
                  DevicesScope.of(context).updateDevicesCapabilities(
                    inputs: [
                      for (final device in data)
                        (
                          device: device,
                          input: [
                            DeviceCapabilityEntity.range(
                              state: value,
                              parameters: null,
                            ),
                          ],
                        ),
                    ],
                  );
                }

                return Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () =>
                            setValue(DeviceCapabilityStateOpenEntity(value: 0)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: context.theme.colorScheme.onSurface,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Закрыть',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setValue(
                            DeviceCapabilityStateOpenEntity(value: 100)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: context.theme.colorScheme.onSurface,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Открыть',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

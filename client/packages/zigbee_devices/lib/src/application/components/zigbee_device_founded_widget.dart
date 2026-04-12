// ignore_for_file: use_build_context_synchronously

import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:zigbee_devices/src/application/components/components.dart';
import 'package:zigbee_devices/src/domain/domain.dart';

class ZigbeeDeviceFoundedWidget extends StatelessWidget {
  const ZigbeeDeviceFoundedWidget({
    super.key,
    required this.device,
  });

  final ZigbeeDeviceEntity device;
  @override
  Widget build(BuildContext context) {
    DeviceEntity? deviceAdded =
        DevicesScope.of(context, listen: true).state.data?.firstWhereOrNull(
              (e) =>
                  e.providerType == DeviceProviderType.zigbee &&
                  e.providerDeviceId == device.id,
            );
    final isAdded = deviceAdded != null;

    return CreateDeviceScope(
      projectId: context.read<ProjectIdController>().value!,
      child: CreateDeviceBlocListener(
        listener: (context, state) => state.mapOrNull(
          failure: (state) =>
              context.app.showErrorDialog(message: state.failure.message),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 24,
                  minWidth: 24,
                ),
                child: getIconsByDeviceType(
                        type: DeviceTypeMapper.toEntity(from: device.type))
                    .icon
                    .svg(
                      width: 24,
                      height: 24,
                    ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AutoSizeText(
                  deviceAdded?.name ?? device.name,
                  style: context.textTheme.titleMedium,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8),
              Builder(builder: (context) {
                final state = CreateDeviceScope.of(context, listen: true).state;
                if (device.interviewCompleted == false || state.isLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (isAdded) {
                  return Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          DeleteDeviceModalScreen(
                            device: deviceAdded,
                          ).show(context);
                        },
                      ),
                    ],
                  );
                }
                return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    final deviceAdded = await AddZigbeeDeviceModalScreen(
                      device: device,
                    ).show(context);
                    if (deviceAdded != null) {
                      final scaffoldContext =
                          context.mainScaffoldKey.currentState!.context;
                      context.navigator.change(
                        (pages) => [
                          pages.first,
                        ],
                      );
                      await Future.delayed(
                        const Duration(milliseconds: 300),
                      );
                      DeviceModalSheet(
                        device: deviceAdded,
                        heroTag: 'zigbee_device_${deviceAdded.id}',
                      ).show(scaffoldContext);
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

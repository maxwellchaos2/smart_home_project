import 'package:common/common.dart';
import 'package:devices/devices.dart';

class DeleteDeviceModalScreen extends StatefulWidget {
  const DeleteDeviceModalScreen({super.key, required this.device});

  final DeviceEntity device;

  Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DeleteDeviceScope(
        projectId: context.read<ProjectIdController>().value!,
        deviceId: device.id,
        child: DeleteDeviceBlocListener(
          listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) {
                context.navigator.popForced();
                return null;
              }),
          child: this,
        ),
      ),
    );
  }

  @override
  State<DeleteDeviceModalScreen> createState() =>
      _DeleteDeviceModalScreenState();
}

class _DeleteDeviceModalScreenState extends State<DeleteDeviceModalScreen> {
  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: SafeArea(
        child: Padding(
          padding: AppPaddings.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: AppPaddings.horizontal,
                child: Text(
                  'Вы уверены, что хотите удалить устройство "${widget.device.name}"?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ).reverseMerge(context.textTheme.titleMedium),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final state =
                            DeleteDeviceScope.of(context, listen: true).state;
                        return AppFormButton.primary(
                          isLoading: state.isLoading,
                          onPressed: () {
                            DeleteDeviceScope.of(context).delete();
                          },
                          child: const Text(
                            'Удалить устройство',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppFormButton.secondary(
                      onPressed: () => context.navigator.popForced(),
                      child: const Text('Отмена'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

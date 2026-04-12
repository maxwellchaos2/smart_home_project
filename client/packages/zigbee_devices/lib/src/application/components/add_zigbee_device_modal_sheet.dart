import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:zigbee_devices/src/domain/domain.dart';

class AddZigbeeDeviceModalScreen extends StatefulWidget {
  const AddZigbeeDeviceModalScreen({super.key, required this.device});

  final ZigbeeDeviceEntity device;

  Future<DeviceEntity?> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CreateDeviceScope(
        projectId: context.read<ProjectIdController>().value!,
        child: CreateDeviceBlocListener(
          listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) {
                context.navigator.popForced(state.data);
                return null;
              }),
          child: this,
        ),
      ),
    );
  }

  @override
  State<AddZigbeeDeviceModalScreen> createState() =>
      _AddZigbeeDeviceModalScreenState();
}

class _AddZigbeeDeviceModalScreenState
    extends State<AddZigbeeDeviceModalScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.device.name);
  }

  void _submit() {
    final device = widget.device.copyWith(name: _nameController.text.trim());
    CreateDeviceScope.of(context).create(
      input: DeviceInputMapper.fromZigbee(from: device),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
                  'Добавление устройства Zigbee',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ).reverseMerge(context.textTheme.titleMedium),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Имя устройства',
                  style: context.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'Введите название устройства',
                ),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final state =
                      CreateDeviceScope.of(context, listen: true).state;
                  return AppFormButton.primary(
                    isLoading: state.isLoading,
                    onPressed: _submit,
                    child: const Text('Добавить'),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.viewInsetsOf(context).bottom + 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

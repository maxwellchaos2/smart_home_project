import 'package:common/common.dart';
import 'package:devices/devices.dart';

class ControllerDevicesScreen extends StatefulWidget with ScreenMixin {
  const ControllerDevicesScreen({super.key});

  @override
  State<ControllerDevicesScreen> createState() =>
      _ControllerDevicesScreenState();
}

class _ControllerDevicesScreenState extends State<ControllerDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Устройства контроллера'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.navigator.push(
                ControllerDeviceEditScreen().page,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final state = DevicesScope.of(context, listen: true).state;
            if (state.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return buildBody(
              context,
              state.data!
                  .where((element) =>
                      element.providerType == DeviceProviderType.logoSiemens)
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<DeviceEntity> data) {
    return ListView.builder(
      padding: AppPaddings.horizontal.copyWith(top: 20),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            onTap: () {
              context.navigator.push(
                ControllerDeviceEditScreen(device: item).page,
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(item.name)),
                  const SizedBox(width: 8),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:common/common.dart';
import 'package:zigbee_devices/src/application/application.dart';

class AddZigbeeDevicesScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const AddZigbeeDevicesScreen({super.key});

  @override
  State<AddZigbeeDevicesScreen> createState() => _AddZigbeeDevicesScreenState();

  @override
  Widget wrappedScreen(BuildContext context) {
    return MultiProvider(
      providers: [
        SearchZigbeeDevicesScope(
          projectId: context.read<ProjectIdController>().value!,
        ),
      ],
      child: this,
    );
  }
}

class _AddZigbeeDevicesScreenState extends State<AddZigbeeDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Устройства Zigbee',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Builder(builder: (context) {
        return Padding(
          padding: AppPaddings.horizontal,
          child: Builder(builder: (context) {
            return SearchZigbeeDevicesScope.of(context, listen: true).state.map(
                  loading: (_) => SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Поиск устройств Zigbee...'),
                        const SizedBox(height: 16),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                  timeout: (state) => SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Устройство не найдено'),
                        const SizedBox(height: 16),
                        AppFormButton.primary(
                          child: Text('Повторить поиск'),
                          onPressed: () {
                            SearchZigbeeDevicesScope.of(context)
                                .startSearchZigbeeDevices();
                          },
                        ),
                      ],
                    ),
                  ),
                  success: (state) {
                    return CustomScrollView(
                      slivers: [
                        ...[
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 8),
                              child: Text(
                                'Новые устройства Zigbee',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SliverList.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              final device = state.data;
                              return ZigbeeDeviceFoundedWidget(
                                device: device,
                              );
                            },
                          ),
                        ],
                      ],
                    );
                  },
                );
          }),
        );
      }),
    );
  }
}

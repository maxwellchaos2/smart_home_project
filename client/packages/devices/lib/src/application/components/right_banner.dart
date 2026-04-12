import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/domain.dart';

class RightBanner extends StatelessWidget {
  const RightBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(35),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Общее',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            const LightWidget(),
            const SizedBox(height: 14),
            ChangeNotifierProvider(
              create: (context) => TemperatureController(value: 22),
              child: TemperatureWidget(),
            ),
            const SizedBox(height: 14),
            DevicesBlocBuilder(
              filter: (device) => device.type == DeviceType.sensorClimate,
              builder: (context, data) {
                if (data.isEmpty) {
                  return const SizedBox();
                }
                return Column(
                  children: [
                    for (final device in data)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: ClimateSensorWidget(
                          device: device,
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}

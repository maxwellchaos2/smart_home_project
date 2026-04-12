import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';

final class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TemperatureController>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF6F6F6F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Assets.icons.devices.sensorClimate.svg(
                width: 45,
                height: 45,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Температура',
                    style: context.textTheme.titleMedium,
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      return Text(
                        '+${controller.value}°C',
                        style: context.textTheme.headlineMedium,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: controller.decrement,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.theme.colorScheme.onSurface,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: 18,
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.increment,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.theme.colorScheme.onSurface,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

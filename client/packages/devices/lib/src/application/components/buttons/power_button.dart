import 'package:common/common.dart';
import 'package:devices/devices.dart';

class PowerButton extends StatelessWidget {
  const PowerButton({
    super.key,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 75, 75),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Icon(Icons.power_settings_new),
      ),
    );
  }
}

class SensorPowerButton extends StatelessWidget {
  const SensorPowerButton({
    super.key,
    required this.device,
    this.buttonNumber = 1,
  });

  final DeviceEntity device;
  final int buttonNumber;
  @override
  Widget build(BuildContext context) {
    final prefix = buttonNumber > 1 ? '_$buttonNumber' : '';
    return PowerButton(
      onTap: () {
        DevicesScope.of(context).updateDevicesProperties(
          inputs: [
            (
              device: device,
              input: [
                DevicePropertyEntity.event(
                  state: {
                    'instance': 'button',
                    'value': 'click$prefix',
                  },
                  parameters: null,
                ),
              ],
            ),
          ],
        );
      },
      onDoubleTap: () {
        DevicesScope.of(context).updateDevicesProperties(
          inputs: [
            (
              device: device,
              input: [
                DevicePropertyEntity.event(
                  state: {
                    'instance': 'button',
                    'value': 'double_click$prefix',
                  },
                  parameters: null,
                ),
              ],
            ),
          ],
        );
      },
      onLongPress: () {
        DevicesScope.of(context).updateDevicesProperties(
          inputs: [
            (
              device: device,
              input: [
                DevicePropertyEntity.event(
                  state: {
                    'instance': 'button',
                    'value': 'long_press$prefix',
                  },
                  parameters: null,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

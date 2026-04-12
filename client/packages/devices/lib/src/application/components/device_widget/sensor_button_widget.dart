import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/application.dart';

class SensorButtonWidget extends BaseDeviceWidget {
  const SensorButtonWidget({
    super.key,
    required super.device,
  });

  @override
  Widget buildCapabilitiesAndProperties(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          for (final property in device.properties) ...[
            if (property is DevicePropertyEventEntity &&
                property.state?['instance'] == 'button') ...[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: SensorPowerButton(
                  device: device,
                ),
              ),
              if (property.parameters?['events'] is List &&
                  (property.parameters?['events'] as List)
                          .firstWhereOrNull((e) => e['value'] == 'click_2') !=
                      null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: SensorPowerButton(
                    device: device,
                    buttonNumber: 2,
                  ),
                ),
              ],
            ]
          ]
        ],
      ),
    );
  }
}

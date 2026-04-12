import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:devices/src/application/application.dart';

class DeviceOnMonitor extends StatelessWidget {
  const DeviceOnMonitor({
    super.key,
    required this.device,
  });

  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    return Hero(
      tag: 'device_on_monitor_${device.id}',
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: () {
            DeviceModalSheet(
              heroTag: 'device_on_monitor_${device.id}',
              device: device,
            ).show(context);
          },
          child: switch (device.type) {
            DeviceType.light => DefaultDeviceWidget(
                device: device,
              ),
            DeviceType.thermostatAc => AirConditionerSliderWidget(
                device: device,
              ),
            DeviceType.openableCurtain => CurtainWidget(
                device: device,
                iconSize: switch (orientation) {
                  Orientation.portrait => 40,
                  Orientation.landscape => 45,
                },
              ),
            DeviceType.doorWithLock => DoorWidget(
                device: device,
              ),
            DeviceType.sensorClimate => ClimateSensorWidget(
                device: device,
              ),
            DeviceType.sensorButton => SensorButtonWidget(
                device: device,
              ),
            _ => DefaultDeviceWidget(
                device: device,
              ),
          },
        ),
      ),
    );
  }
}

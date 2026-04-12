import 'package:devices/src/domain/domain.dart';

String unitToString(
  DeviceUnit? unit,
) {
  return switch (unit) {
    DeviceUnit.celsius => '°C',
    DeviceUnit.fahrenheit => '°F',
    DeviceUnit.percent => '%',
    null => '',
  };
}

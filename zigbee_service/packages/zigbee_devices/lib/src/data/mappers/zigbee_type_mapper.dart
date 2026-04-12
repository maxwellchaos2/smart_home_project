import 'package:devices/devices.dart';
import 'package:zigbee_devices/src/data/models/models.dart';

abstract final class ZigbeeTypeMapper {
  static DeviceType toDeviceType(
      {required ZigbeeDeviceModel from, Map<String, dynamic>? changedState}) {
    if (from.definition != null) {
      final desc = from.definition!.description.toLowerCase();
      for (final expose
          in from.definition?.exposes ?? <ZigbeeDeviceExposeModel>[]) {
        if (expose.name == 'action') {
          return DeviceType.sensorButton;
        }
        if (expose.name == 'position') {
          return DeviceType.openableCurtain;
        }
        if (expose.name == 'contact') {
          return DeviceType.sensorOpen;
        }
        if (expose.name == 'temperature') {
          return DeviceType.sensorClimate;
        }
        if (expose.name == 'humidity') {
          return DeviceType.sensorClimate;
        }
      }
      if (changedState != null) {
        if (changedState.containsKey('action')) {
          return DeviceType.sensorButton;
        }
        if (changedState.containsKey('position')) {
          return DeviceType.openableCurtain;
        }
        if (changedState.containsKey('contact')) {
          return DeviceType.sensorOpen;
        }
        if (changedState.containsKey('temperature')) {
          return DeviceType.sensorClimate;
        }
        if (changedState.containsKey('humidity')) {
          return DeviceType.sensorClimate;
        }
      }
      if (desc.contains('light')) {
        return DeviceType.light;
      } else if (desc.contains('button')) {
        return DeviceType.sensorButton;
      } else if (desc.contains('switch')) {
        if (from.definition!.exposes.any((e) => e.type == 'enum')) {
          return DeviceType.sensorButton;
        }
        return DeviceType.switch_;
      } else if (desc.contains('outlet') ||
          desc.contains('plug') ||
          desc.contains('socket')) {
        return DeviceType.socket;
      } else if (desc.contains('thermostat')) {
        return DeviceType.thermostat;
      } else if (desc.contains('valve')) {
        return DeviceType.openableValve;
      } else if (desc.contains('curtain') || desc.contains('blind')) {
        return DeviceType.openableCurtain;
      } else if (desc.contains('camera')) {
        return DeviceType.camera;
      } else if (desc.contains('media') || desc.contains('tv')) {
        return DeviceType.mediaDevice;
      } else if (desc.contains('cooker') ||
          desc.contains('kettle') ||
          desc.contains('coffee maker') ||
          desc.contains('dishwasher')) {
        return DeviceType.cooking;
      } else if (desc.contains('cover')) {
        return DeviceType.openableCurtain;
      } else if (desc.contains('iron')) {
        return DeviceType.iron;
      } else if (desc.contains('vacuum')) {
        return DeviceType.vacuumCleaner;
      } else if (desc.contains('washing machine')) {
        return DeviceType.washingMachine;
      } else if (desc.contains('humidifier') || desc.contains('purifier')) {
        return DeviceType.humidifier;
      } else if (desc.contains('fan') || desc.contains('ventilation')) {
        return DeviceType.ventilationFan;
      } else if (desc.contains('pet')) {
        return DeviceType.petFeeder;
      } else if (desc.contains('temperature')) {
        return DeviceType.sensorClimate;
      } else if (desc.contains('smoke')) {
        return DeviceType.sensorSmoke;
      } else if (desc.contains('gas')) {
        return DeviceType.sensorGas;
      } else if (desc.contains('water leak') || desc.contains('flood')) {
        return DeviceType.sensorWaterLeak;
      } else if (desc.contains('motion') || desc.contains('occupancy')) {
        return DeviceType.sensorMotion;
      } else if (desc.contains('vibration') || desc.contains('shock')) {
        return DeviceType.sensorVibration;
      } else if (desc.contains('illumination') || desc.contains('light')) {
        return DeviceType.sensorIllumination;
      } else if (desc.contains('open') || desc.contains('contact')) {
        return DeviceType.sensorOpen;
      } else if (desc.contains('climate')) {
        return DeviceType.sensorClimate;
      } else if (desc.contains('electricity') ||
          desc.contains('water') ||
          desc.contains('heat') ||
          desc.contains('gas meter')) {
        return DeviceType.smartMeter;
      }
      if (desc.contains('sensor')) {
        return DeviceType.sensor;
      }
    }
    return DeviceType.other;
  }
}

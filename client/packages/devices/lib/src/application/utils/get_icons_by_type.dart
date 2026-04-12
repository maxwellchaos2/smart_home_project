import 'package:common/common.dart';
import 'package:devices/devices.dart';

({SvgGenImage icon, SvgGenImage iconOff}) getIconsByDeviceType({
  required DeviceType type,
}) {
  return switch (type) {
    DeviceType.light => (
        icon: Assets.icons.devices.light,
        iconOff: Assets.icons.devices.lightOff,
      ),
    DeviceType.mediaDeviceTV => (
        icon: Assets.icons.devices.mediaDeviceTv,
        iconOff: Assets.icons.devices.mediaDeviceTvOff,
      ),
    DeviceType.cookingKettle => (
        icon: Assets.icons.devices.cookingKettle,
        iconOff: Assets.icons.devices.cookingKettleOff,
      ),
    DeviceType.vacuumCleaner => (
        icon: Assets.icons.devices.vacuumCleaner,
        iconOff: Assets.icons.devices.vacuumCleanerOff,
      ),
    DeviceType.thermostatAc => (
        icon: Assets.icons.devices.thermostatAc,
        iconOff: Assets.icons.devices.thermostatAcOff,
      ),
    DeviceType.sensorClimate => (
        icon: Assets.icons.devices.sensorClimate,
        iconOff: Assets.icons.devices.sensorClimate,
      ),
    DeviceType.sensorMotion => (
        icon: Assets.icons.devices.sensorMotion,
        iconOff: Assets.icons.devices.sensorMotion,
      ),
    DeviceType.sensorOpen => (
        icon: Assets.icons.devices.sensorOpen,
        iconOff: Assets.icons.devices.sensorOpenOff,
      ),
    DeviceType.switch_ => (
        icon: Assets.icons.devices.switchq,
        iconOff: Assets.icons.devices.switchqOff,
      ),
    DeviceType.openableCurtain => (
        icon: Assets.icons.devices.openableCurtain,
        iconOff: Assets.icons.devices.openableCurtainOff,
      ),
    DeviceType.sensorSmoke => (
        icon: Assets.icons.devices.sensorOther,
        iconOff: Assets.icons.devices.sensorOther,
      ),
    DeviceType.sensorGas => (
        icon: Assets.icons.devices.sensorOther,
        iconOff: Assets.icons.devices.sensorOther,
      ),
    DeviceType.sensorWaterLeak => (
        icon: Assets.icons.devices.sensorWaterLeak,
        iconOff: Assets.icons.devices.sensorWaterLeak,
      ),
    DeviceType.sensorVibration => (
        icon: Assets.icons.devices.sensorVibration,
        iconOff: Assets.icons.devices.sensorVibration,
      ),
    DeviceType.sensorButton => (
        icon: Assets.icons.devices.sensorButton,
        iconOff: Assets.icons.devices.sensorButton,
      ),
    DeviceType.lightStrip => (
        icon: Assets.icons.devices.lightStrip,
        iconOff: Assets.icons.devices.lightStripOff,
      ),
    DeviceType.doorWithLock => (
        icon: Assets.icons.devices.doorWithLockOpened,
        iconOff: Assets.icons.devices.doorWithLock,
      ),
    DeviceType.controlBoxHub => (
        icon: Assets.icons.devices.controlBoxHub,
        iconOff: Assets.icons.devices.controlBoxHub,
      ),
    DeviceType.camera => (
        icon: Assets.icons.devices.camera,
        iconOff: Assets.icons.devices.camera,
      ),
    _ => (
        icon: Assets.icons.devices.other,
        iconOff: Assets.icons.devices.otherOff,
      ),
  };
}

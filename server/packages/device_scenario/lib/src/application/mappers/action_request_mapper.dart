import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/domain/domain.dart';
import 'package:devices/devices.dart';

abstract final class ActionRequestMapper {
  static ActionEntity toEntity({required ActionRequestModel from}) {
    return from.map(
      changeDeviceState: (from) => ActionEntity.changeDeviceState(
        deviceId: from.deviceId,
        state: DeviceCapabilityStateEntity.fromJson(from.state),
      ),
      delay: (from) => ActionEntity.delay(
        seconds: from.seconds,
      ),
    );
  }
}

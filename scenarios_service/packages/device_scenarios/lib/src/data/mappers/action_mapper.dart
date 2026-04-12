import 'package:devices/devices.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class ActionMapper {
  static ActionEntity toEntity({required ActionModel from}) {
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

  static ActionModel toModel({required ActionEntity from}) {
    return from.map(
      changeDeviceState: (from) => ActionModel.changeDeviceState(
        deviceId: from.deviceId,
        state: from.state.toJson(),
      ),
      delay: (from) => ActionModel.delay(
        seconds: from.seconds,
      ),
    );
  }
}

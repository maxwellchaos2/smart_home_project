import 'package:device_scenario/src/application/application.dart';
import 'package:device_scenario/src/domain/domain.dart';

abstract final class ActionResponseMapper {
  static ActionResponseModel toModel({required ActionEntity from}) {
    return from.map(
      changeDeviceState: (from) => ActionResponseModel.changeDeviceState(
        deviceId: from.deviceId,
        state: from.state.toJson(),
      ),
      delay: (from) => ActionResponseModel.delay(
        seconds: from.seconds,
      ),
    );
  }
}

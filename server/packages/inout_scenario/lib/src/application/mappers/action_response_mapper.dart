import 'package:inout_scenario/src/application/models/models.dart';
import 'package:inout_scenario/src/domain/domain.dart';

abstract final class ActionResponseMapper {
  static ActionResponseModel toModel({required ActionEntity from}) {
    return from.map(
      changeDevice: (from) => ActionResponseModel.changeDevice(
        deviceId: from.deviceId,
        state: from.state,
      ),
      delay: (from) => ActionResponseModel.delay(
        seconds: from.seconds,
      ),
    );
  }
}

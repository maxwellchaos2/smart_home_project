import 'package:inout_scenario/src/application/models/models.dart';
import 'package:inout_scenario/src/domain/domain.dart';

abstract final class ActionRequestMapper {
  static ActionEntity toEntity({required ActionRequestModel from}) {
    return from.map(
      changeDevice: (from) => ActionEntity.changeDevice(
        deviceId: from.deviceId,
        state: from.state,
      ),
      delay: (from) => ActionEntity.delay(
        seconds: from.seconds,
      ),
    );
  }
}

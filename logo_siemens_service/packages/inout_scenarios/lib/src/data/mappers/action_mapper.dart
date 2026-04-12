import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class ActionMapper {
  static ActionEntity toEntity({required ActionModel from}) {
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

  static ActionModel toModel({required ActionEntity from}) {
    return from.map(
      changeDevice: (from) => ActionModel.changeDevice(
        deviceId: from.deviceId,
        state: from.state,
      ),
      delay: (from) => ActionModel.delay(
        seconds: from.seconds,
      ),
    );
  }
}

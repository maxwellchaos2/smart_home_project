import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class YandexDevicesStatesPayloadInputMapper {
  static YandexDevicesStatesPayloadInputModel toModel(
      {required YandexDevicesStatesPayloadInputEntity from}) {
    return YandexDevicesStatesPayloadInputModel(
      userId: from.userId,
      devices: from.devices
          .map((e) => YandexDeviceStateInputMapper.toModel(from: e))
          .toList(),
    );
  }
}

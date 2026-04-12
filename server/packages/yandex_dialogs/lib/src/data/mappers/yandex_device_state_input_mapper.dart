import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class YandexDeviceStateInputMapper {
  static YandexDeviceStateInputModel toModel(
      {required YandexDeviceStateInputEntity from}) {
    return YandexDeviceStateInputModel(
      id: from.id,
      status: switch (from.status) {
        YandexDeviceStateStatus.online => 'online',
        YandexDeviceStateStatus.offline => 'offline',
      },
    );
  }
}

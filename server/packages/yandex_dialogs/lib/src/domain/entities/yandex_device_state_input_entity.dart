import 'package:common/common.dart';

part 'yandex_device_state_input_entity.freezed.dart';

@freezed
sealed class YandexDeviceStateInputEntity with _$YandexDeviceStateInputEntity {
  const factory YandexDeviceStateInputEntity({
    required String id,
    required YandexDeviceStateStatus status,
  }) = _YandexDeviceStateInputEntity;
}

enum YandexDeviceStateStatus {
  online,
  offline,
}

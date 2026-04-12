import 'package:common/common.dart';

part 'yandex_action_device_result_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class YandexActionDeviceResultEntity
    with _$YandexActionDeviceResultEntity {
  const YandexActionDeviceResultEntity._();

  const factory YandexActionDeviceResultEntity({
    required String type,
    required bool isDone,
  }) = _YandexActionDeviceResultEntity;
}

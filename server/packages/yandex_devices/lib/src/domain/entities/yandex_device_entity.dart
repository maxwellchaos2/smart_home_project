import 'package:common/common.dart';

part 'yandex_device_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class YandexDeviceEntity with _$YandexDeviceEntity {
  const YandexDeviceEntity._();

  const factory YandexDeviceEntity({
    required String id,
    required String name,
    required String type,
    required List<Map<String, dynamic>> capabilities,
    required List<Map<String, dynamic>> properties,
  }) = _YandexDeviceEntity;
}

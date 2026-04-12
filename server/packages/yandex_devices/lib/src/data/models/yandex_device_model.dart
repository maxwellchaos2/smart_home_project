import 'package:common/common.dart';

part 'yandex_device_model.freezed.dart';
part 'yandex_device_model.g.dart';

@Freezed(fromJson: true)
sealed class YandexDeviceModel with _$YandexDeviceModel {
  const YandexDeviceModel._();

  const factory YandexDeviceModel({
    required String id,
    required String name,
    required String type,
    required String? skillId,
    required List<Map<String, dynamic>> capabilities,
    required List<Map<String, dynamic>> properties,
  }) = _YandexDeviceModel;

  factory YandexDeviceModel.fromJson(Map<String, Object?> json) =>
      _$YandexDeviceModelFromJson(json);
}

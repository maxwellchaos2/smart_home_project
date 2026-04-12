import 'package:common/common.dart';

import 'device_status_info_model.dart';

part 'yandex_device_response_model.freezed.dart';
part 'yandex_device_response_model.g.dart';

@Freezed(toJson: true)
sealed class YandexDeviceResponseModel with _$YandexDeviceResponseModel {
  const YandexDeviceResponseModel._();

  const factory YandexDeviceResponseModel({
    required String id,
    required String name,
    required DeviceStatusInfoModel statusInfo,
    required String? description,
    required String? room,
    required String type,
    required Map<String, dynamic>? customData,
    required List<Map<String, dynamic>>? capabilities,
    required List<Map<String, dynamic>>? properties,
    required Map<String, dynamic>? deviceInfo,
  }) = _YandexDeviceResponseModel;

  @override
  Map<String, Object?> toJson();
}

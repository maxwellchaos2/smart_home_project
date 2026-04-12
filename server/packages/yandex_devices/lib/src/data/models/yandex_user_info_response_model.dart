import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_devices/src/data/models/yandex_device_model.dart';

part 'yandex_user_info_response_model.freezed.dart';
part 'yandex_user_info_response_model.g.dart';

@Freezed(fromJson: true)
sealed class YandexUserInfoResponseModel with _$YandexUserInfoResponseModel {
  const YandexUserInfoResponseModel._();

  const factory YandexUserInfoResponseModel({
    required List<YandexDeviceModel> devices,
  }) = _YandexUserInfoResponseModel;

  factory YandexUserInfoResponseModel.fromJson(Map<String, Object?> json) =>
      _$YandexUserInfoResponseModelFromJson(json);
}

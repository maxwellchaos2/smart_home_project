import 'package:common/common.dart';

part 'yandex_device_state_input_model.freezed.dart';
part 'yandex_device_state_input_model.g.dart';

@Freezed(toJson: true)
sealed class YandexDeviceStateInputModel with _$YandexDeviceStateInputModel {
  const YandexDeviceStateInputModel._();

  const factory YandexDeviceStateInputModel({
    required String id,
    required String status,
  }) = _YandexDeviceStateInputModel;

  @override
  Map<String, dynamic> toJson();
}

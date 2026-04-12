import 'package:common/common.dart';
import 'package:yandex_dialogs/src/data/data.dart';

part 'yandex_devices_states_payload_input_model.freezed.dart';
part 'yandex_devices_states_payload_input_model.g.dart';

@Freezed(toJson: true)
sealed class YandexDevicesStatesPayloadInputModel
    with _$YandexDevicesStatesPayloadInputModel {
  const YandexDevicesStatesPayloadInputModel._();

  const factory YandexDevicesStatesPayloadInputModel({
    required String userId,
    required List<YandexDeviceStateInputModel> devices,
  }) = _YandexDevicesStatesPayloadInputModel;

  @override
  Map<String, dynamic> toJson();
}

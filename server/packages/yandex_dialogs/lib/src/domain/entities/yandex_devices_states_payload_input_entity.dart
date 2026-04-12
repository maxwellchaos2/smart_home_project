import 'package:common/common.dart';
import 'package:yandex_dialogs/src/domain/domain.dart';

part 'yandex_devices_states_payload_input_entity.freezed.dart';

@freezed
sealed class YandexDevicesStatesPayloadInputEntity
    with _$YandexDevicesStatesPayloadInputEntity {
  const factory YandexDevicesStatesPayloadInputEntity({
    required String userId,
    required List<YandexDeviceStateInputEntity> devices,
  }) = _YandexDevicesStatesPayloadInputEntity;
}

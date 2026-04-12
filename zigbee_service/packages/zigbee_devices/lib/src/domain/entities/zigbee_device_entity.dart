import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'zigbee_device_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ZigbeeDeviceEntity with _$ZigbeeDeviceEntity {
  const ZigbeeDeviceEntity._();

  const factory ZigbeeDeviceEntity({
    required String id,
    required String name,
    required String type,
    required List<DeviceCapabilityEntity> capabilities,
    required List<DevicePropertyEntity> properties,
  }) = _ZigbeeDeviceEntity;
}

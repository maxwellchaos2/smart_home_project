import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';

part 'device_input_entity.freezed.dart';

@freezed
sealed class DeviceInputEntity with _$DeviceInputEntity {
  const factory DeviceInputEntity({
    required String? providerDeviceId,
    required DeviceProviderType providerType,
    required DeviceType type,
    required String name,
    required bool isHidden,
    required List<DeviceCapabilityEntity> capabilities,
    required List<DevicePropertyEntity> properties,
    required int? roomId,
    required int? floorId,
    required Map<String, Object?>? customData,
  }) = _DeviceInputEntity;
}

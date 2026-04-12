import 'package:common/common.dart';
import 'package:devices_entities/src/domain/domain.dart';

part 'device_input_entity.freezed.dart';

@freezed
sealed class DeviceInputEntity with _$DeviceInputEntity {
  const factory DeviceInputEntity({
    required String? providerDeviceId,
    required DeviceProviderType providerType,
    required DeviceType type,
    required int? inputId,
    required int? outputId,
    required String name,
    required List<DeviceCapabilityEntity> capabilities,
    required List<DevicePropertyEntity> properties,
    required int? roomId,
    required int? floorId,
  }) = _DeviceInputEntity;
}

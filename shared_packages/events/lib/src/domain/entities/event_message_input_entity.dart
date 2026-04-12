import 'package:common/common.dart';
import 'package:devices_entities/devices_entities.dart';

part 'event_message_input_entity.freezed.dart';

@freezed
sealed class EventMessageInputEntity with _$EventMessageInputEntity {
  const factory EventMessageInputEntity.needDeviceCapabilitiesChange({
    int? deviceId,
    DeviceProviderType? providerType,
    String? providerDeviceId,
    required List<DeviceCapabilityEntity> capabilities,
  }) = _EventMessageInputEntity;

  const factory EventMessageInputEntity.deviceCapabilitiesChanged({
    int? deviceId,
    DeviceProviderType? providerType,
    String? providerDeviceId,
    required List<DeviceCapabilityEntity> capabilities,
  }) = _EventMessageDeviceCapabilitiesChangedEntity;

  const factory EventMessageInputEntity.devicePropertiesChanged({
    int? deviceId,
    DeviceProviderType? providerType,
    String? providerDeviceId,
    required List<DevicePropertyEntity> properties,
  }) = _EventMessageDevicePropertiesChangedEntity;

  const factory EventMessageInputEntity.newZigbeeDevice({
    required Map<String, dynamic> device,
  }) = _EventMessageNewZigbeeDeviceEntity;

  const factory EventMessageInputEntity.onDeviceHeartbeat({
    required int deviceId,
  }) = _OnDeviceHeartbeatEventMessageInputEntity;
}

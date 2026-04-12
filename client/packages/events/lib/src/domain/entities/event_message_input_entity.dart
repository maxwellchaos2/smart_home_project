import 'package:common/common.dart';
import 'package:devices/devices.dart';

part 'event_message_input_entity.freezed.dart';

@freezed
sealed class EventMessageInputEntity with _$EventMessageInputEntity {
  const factory EventMessageInputEntity.needDeviceCapabilitiesChange({
    required int deviceId,
    required List<DeviceCapabilityEntity> capabilities,
  }) = _EventMessageInputEntity;

  const factory EventMessageInputEntity.devicePropertiesChanged({
    required int deviceId,
    required List<DevicePropertyEntity> properties,
  }) = _EventMessageDevicePropertiesChangedEntity;

  const factory EventMessageInputEntity.permitJoinZigbeeDevices({
    required int projectId,
    required bool value,
    required int time,
  }) = _EventMessagePermitJoinZigbeeDevicesEntity;
}

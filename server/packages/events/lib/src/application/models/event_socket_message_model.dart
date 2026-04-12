import 'package:devices/devices.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zigbee_devices/zigbee_devices.dart';

part 'event_socket_message_model.freezed.dart';
part 'event_socket_message_model.g.dart';

@Freezed(fromJson: true, unionKey: 'type')
class EventSocketMessageModel with _$EventSocketMessageModel {
  const EventSocketMessageModel._();

  const factory EventSocketMessageModel.needDeviceCapabilitiesChange({
    int? deviceId,
    String? providerType,
    String? providerDeviceId,
    required List<DeviceCapabilityEntity> capabilities,
  }) = NeedDeviceCapabilitiesChangeEventSocketMessageModel;

  const factory EventSocketMessageModel.deviceCapabilitiesChanged({
    int? deviceId,
    String? providerType,
    String? providerDeviceId,
    required List<DeviceCapabilityEntity> capabilities,
  }) = DeviceCapabilitiesChangedEventSocketMessageModel;

  const factory EventSocketMessageModel.devicePropertiesChanged({
    int? deviceId,
    String? providerType,
    String? providerDeviceId,
    required List<DevicePropertyEntity> properties,
  }) = DevicePropertiesChangedEventSocketMessageModel;

  const factory EventSocketMessageModel.perminJoinZigbeeDevices({
    required int projectId,
    required bool value,
    required int time,
  }) = PerminJoinZigbeeDevicesEventSocketMessageModel;

  const factory EventSocketMessageModel.newZigbeeDevice(
          {required ZigbeeDeviceModel device}) =
      NewZigbeeDeviceEventSocketMessageModel;

  const factory EventSocketMessageModel.onDeviceHeartbeat({
    required int deviceId,
  }) = OnDeviceHeartbeatEventSocketMessageModel;

  factory EventSocketMessageModel.fromJson(Map<String, Object?> json) =>
      _$EventSocketMessageModelFromJson(json);
}

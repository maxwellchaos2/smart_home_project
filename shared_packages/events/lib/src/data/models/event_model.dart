import 'package:common/common.dart';
import 'package:devices_entities/devices_entities.dart';
import 'package:rooms_entities/rooms_entities.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@Freezed(fromJson: true, unionKey: 'type')
sealed class EventModel with _$EventModel {
  const EventModel._();

  const factory EventModel.deviceCreated({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _EventNeedDeviceCreatedModel;

  const factory EventModel.deviceUpdated({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _EventNeedDeviceUpdatedModel;

  const factory EventModel.deviceDeleted({
    required int id,
    required DeviceResponseModel device,
    required DateTime createdAt,
  }) = _EventNeedDeviceDeletedModel;

  const factory EventModel.roomCreated({
    required RoomModel room,
    required DateTime createdAt,
  }) = _EventRoomCreatedModel;

  const factory EventModel.roomUpdated({
    required RoomModel room,
    required DateTime createdAt,
  }) = _EventRoomUpdatedModel;

  const factory EventModel.roomDeleted({
    required RoomModel room,
    required DateTime createdAt,
  }) = _EventRoomDeletedModel;

  const factory EventModel.needDeviceCapabilitiesChange({
    required int deviceId,
    required List<DeviceCapabilityEntity> capabilities,
  }) = _EventNeedDeviceCapabilitiesChangeModel;

  const factory EventModel.deviceStateChanged({
    required int deviceId,
    required List<DeviceCapabilityEntity>? deviceCapabilities,
    required List<DevicePropertyEntity>? deviceProperties,
  }) = _EventDeviceStateChangedModel;

  const factory EventModel.needRunDeviceScenario({
    required int scenarioId,
  }) = _EventNeedRunDeviceScenarioModel;

  const factory EventModel.permitJoinZigbeeDevices({
    required bool value,
    required int time,
  }) = _EventPermitJoinZigbeeDevicesModel;

  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}

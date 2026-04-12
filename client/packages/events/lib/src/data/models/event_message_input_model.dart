import 'package:common/common.dart';

part 'event_message_input_model.freezed.dart';
part 'event_message_input_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
sealed class EventMessageInputModel with _$EventMessageInputModel {
  const EventMessageInputModel._();

  @JsonSerializable(includeIfNull: false)
  const factory EventMessageInputModel.needDeviceCapabilitiesChange({
    required int deviceId,
    required List<Map<String, dynamic>> capabilities,
  }) = _EventMessageNeedDeviceChangeModel;

  @JsonSerializable(includeIfNull: false)
  const factory EventMessageInputModel.devicePropertiesChanged({
    required int deviceId,
    required List<Map<String, dynamic>> properties,
  }) = _EventMessageDevicePropertiesChangedModel;

  @JsonSerializable(includeIfNull: false)
  const factory EventMessageInputModel.permitJoinZigbeeDevices({
    required int projectId,
    required bool value,
    required int time,
  }) = _EventMessagePermitJoinZigbeeDevicesModel;

  @override
  Map<String, dynamic> toJson();
}

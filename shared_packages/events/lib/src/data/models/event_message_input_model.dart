import 'package:common/common.dart';

part 'event_message_input_model.freezed.dart';
part 'event_message_input_model.g.dart';

@Freezed(toJson: true, unionKey: 'type')
sealed class EventMessageInputModel with _$EventMessageInputModel {
  const EventMessageInputModel._();

  @JsonSerializable(includeIfNull: false)
  const factory EventMessageInputModel.needDeviceCapabilitiesChange({
    int? deviceId,
    String? providerType,
    String? providerDeviceId,
    required List<Map<String, dynamic>> capabilities,
  }) = _EventMessageNeedDeviceChangeModel;

  @JsonSerializable(includeIfNull: false)
  const factory EventMessageInputModel.deviceCapabilitiesChanged({
    int? deviceId,
    String? providerType,
    String? providerDeviceId,
    required List<Map<String, dynamic>> capabilities,
  }) = _EventMessageDeviceCapabilitiesChangedModel;

  @JsonSerializable(includeIfNull: false)
  const factory EventMessageInputModel.devicePropertiesChanged({
    int? deviceId,
    String? providerType,
    String? providerDeviceId,
    required List<Map<String, dynamic>> properties,
  }) = _EventMessageDevicePropertiesChangedModel;

  @JsonSerializable()
  const factory EventMessageInputModel.newZigbeeDevice({
    required Map<String, dynamic> device,
  }) = _EventMessageNewZigbeeDeviceModel;

  @JsonSerializable()
  const factory EventMessageInputModel.onDeviceHeartbeat({
    required int deviceId,
  }) = _OnDeviceHeartbeatEventMessageInputModel;

  @override
  Map<String, dynamic> toJson();
}

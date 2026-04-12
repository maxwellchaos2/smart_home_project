import 'package:freezed_annotation/freezed_annotation.dart';

part 'devices_state_input_request_model.freezed.dart';
part 'devices_state_input_request_model.g.dart';

@Freezed(fromJson: true)
sealed class DevicesStateInputRequestModel
    with _$DevicesStateInputRequestModel {
  const DevicesStateInputRequestModel._();

  const factory DevicesStateInputRequestModel({
    required List<DeviceStateInputRequestModel> devices,
  }) = _DevicesStateInputRequestModel;

  factory DevicesStateInputRequestModel.fromJson(Map<String, Object?> json) =>
      _$DevicesStateInputRequestModelFromJson(json);
}

@Freezed(fromJson: true)
sealed class DeviceStateInputRequestModel with _$DeviceStateInputRequestModel {
  const DeviceStateInputRequestModel._();

  const factory DeviceStateInputRequestModel({
    required String id,
    required Map<String, dynamic>? customData,
  }) = _DeviceStateInputRequestModel;

  factory DeviceStateInputRequestModel.fromJson(Map<String, Object?> json) =>
      _$DeviceStateInputRequestModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_position_input_request_model.freezed.dart';
part 'device_position_input_request_model.g.dart';

@Freezed(fromJson: true)
class DevicePositionInputRequestModel with _$DevicePositionInputRequestModel {
  const DevicePositionInputRequestModel._();

  const factory DevicePositionInputRequestModel({
    required double x,
    required double y,
    required double angle,
    required int deviceId,
  }) = _DevicePositionInputRequestModel;

  factory DevicePositionInputRequestModel.fromJson(Map<String, Object?> json) =>
      _$DevicePositionInputRequestModelFromJson(json);
}

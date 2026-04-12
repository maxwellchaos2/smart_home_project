import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_position_response_model.freezed.dart';
part 'device_position_response_model.g.dart';

@Freezed(toJson: true)
class DevicePositionResponseModel with _$DevicePositionResponseModel {
  const DevicePositionResponseModel._();

  const factory DevicePositionResponseModel({
    required int id,
    required double x,
    required double y,
    required double angle,
    required String? iconMediaPath,
    required String? disabledIconMediaPath,
    required int deviceId,
  }) = _DevicePositionResponseModel;

  @override
  Map<String, dynamic> toJson();
}

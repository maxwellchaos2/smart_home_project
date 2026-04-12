import 'package:common/common.dart';

part 'device_position_model.freezed.dart';
part 'device_position_model.g.dart';

@Freezed(fromJson: true)
sealed class DevicePositionModel with _$DevicePositionModel {
  const DevicePositionModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DevicePositionModel({
    required int id,
    required double x,
    required double y,
    required double angle,
    required String? iconMediaPath,
    required String? disabledIconMediaPath,
    required int deviceId,
  }) = _DevicePositionModel;

  factory DevicePositionModel.fromJson(Map<String, Object?> json) =>
      _$DevicePositionModelFromJson(json);
}

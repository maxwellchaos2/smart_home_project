import 'package:common/common.dart';

part 'device_position_input_model.freezed.dart';
part 'device_position_input_model.g.dart';

@Freezed(toJson: true)
sealed class DevicePositionInputModel with _$DevicePositionInputModel {
  const DevicePositionInputModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DevicePositionInputModel({
    required double x,
    required double y,
    required double angle,
    required String? iconMediaPath,
    required String? disabledIconMediaPath,
    required int deviceId,
  }) = _DevicePositionInputModel;

  @override
  Map<String, dynamic> toJson();
}

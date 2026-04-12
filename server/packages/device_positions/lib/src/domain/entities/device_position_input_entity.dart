import 'package:common/common.dart';

part 'device_position_input_entity.freezed.dart';

@freezed
sealed class DevicePositionInputEntity with _$DevicePositionInputEntity {
  const factory DevicePositionInputEntity({
    required double x,
    required double y,
    required double angle,
    required String? iconMediaPath,
    required String? disabledIconMediaPath,
    required int deviceId,
  }) = _DevicePositionInputEntity;
}

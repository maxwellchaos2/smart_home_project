import 'package:common/common.dart';

part 'device_position_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class DevicePositionEntity with _$DevicePositionEntity {
  const DevicePositionEntity._();

  const factory DevicePositionEntity({
    required int id,
    required double x,
    required double y,
    required double angle,
    required String? iconMediaPath,
    required String? disabledIconMediaPath,
    required int deviceId,
  }) = _DevicePositionEntity;
}

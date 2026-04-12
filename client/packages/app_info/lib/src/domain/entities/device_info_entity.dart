import 'package:common/common.dart';

part 'device_info_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class DeviceInfoEntity with _$DeviceInfoEntity {
  const DeviceInfoEntity._();

  const factory DeviceInfoEntity({
    required String? name,
    required String? family,
    required String? systemVersion,
    required String? systemName,
  }) = _DeviceInfoEntity;
}

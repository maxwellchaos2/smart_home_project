import 'package:app_info/src/domain/entities/device_info_entity.dart';
import 'package:common/common.dart';

import 'package_info_entity.dart';

part 'app_info_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class AppInfoEntity with _$AppInfoEntity {
  const AppInfoEntity._();

  const factory AppInfoEntity({
    required String deviceId,
    required DeviceInfoEntity device,
    required PackageInfoEntity package,
  }) = _AppInfoEntity;
}

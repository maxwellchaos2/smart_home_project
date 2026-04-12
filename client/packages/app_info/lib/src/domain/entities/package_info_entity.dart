import 'package:common/common.dart';

part 'package_info_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class PackageInfoEntity with _$PackageInfoEntity {
  const PackageInfoEntity._();

  const factory PackageInfoEntity({
    required String appName,
    required String packageName,
    required String version,
    required String buildNumber,
    required String? installerStore,
  }) = _PackageInfoEntity;
}

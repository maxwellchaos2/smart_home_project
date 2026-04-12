import 'package:app_info/src/domain/domain.dart';
import 'package:package_info_plus_platform_interface/package_info_data.dart';

abstract final class PackageInfoMapper {
  static PackageInfoEntity toEntity({required PackageInfoData from}) {
    return PackageInfoEntity(
      appName: from.appName,
      packageName: from.packageName,
      version: from.version,
      buildNumber: from.buildNumber,
      installerStore: from.installerStore,
    );
  }
}

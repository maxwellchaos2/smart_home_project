import 'package:package_info_plus_platform_interface/package_info_data.dart';
import 'package:package_info_plus_platform_interface/package_info_platform_interface.dart';

abstract interface class IPackageInfoPlusClient {
  Future<PackageInfoData> fetch();
}

final class PackageInfoPlusClientImpl implements IPackageInfoPlusClient {
  const PackageInfoPlusClientImpl({required PackageInfoPlatform plugin})
      : _plugin = plugin;

  final PackageInfoPlatform _plugin;

  @override
  Future<PackageInfoData> fetch() {
    return _plugin.getAll();
  }
}

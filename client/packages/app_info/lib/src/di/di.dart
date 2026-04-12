import 'package:android_id/android_id.dart';
import 'package:app_info/src/data/data.dart';
import 'package:app_info/src/domain/repositories/app_info_repository.dart';
import 'package:common/common.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus_platform_interface/package_info_platform_interface.dart';

abstract final class AppInfoDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getPackageInfoDatasource());
    locator.registerLazySingleton(() => getDeviceInfoDatasource());
    locator.registerLazySingleton(() => getDeviceIdDatasource());
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IPackageInfoPlatformDatasource getPackageInfoDatasource() {
    return PackageInfoPlatformDatasourceImpl(
      client: PackageInfoPlusClientImpl(
        plugin: PackageInfoPlatform.instance,
      ),
    );
  }

  static IDeviceInfoPlatformDatasource getDeviceInfoDatasource() {
    return DeviceInfoPlatformDatasourceImpl(
      client: DeviceInfoPlusClientImpl(
        plugin: DeviceInfoPlugin(),
      ),
    );
  }

  static IDeviceIdPlatformDatasource getDeviceIdDatasource() {
    return DeviceIdPlatformDatasourceImpl(
      client: DeviceIdApiClientImpl(
        androidId: const AndroidId(),
      ),
    );
  }

  static IAppInfoRepository getRepo({
    required GetIt locator,
  }) {
    return AppInfoRepositoryImpl(
      deviceIdSource: locator.get(),
      packageInfoSource: locator.get(),
      deviceInfoSource: locator.get(),
    );
  }
}

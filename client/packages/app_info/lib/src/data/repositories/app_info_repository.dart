import 'package:app_info/src/data/datasources/datasources.dart';
import 'package:app_info/src/domain/domain.dart';

final class AppInfoRepositoryImpl implements IAppInfoRepository {
  AppInfoRepositoryImpl({
    required IPackageInfoPlatformDatasource packageInfoSource,
    required IDeviceInfoPlatformDatasource deviceInfoSource,
    required IDeviceIdPlatformDatasource deviceIdSource,
  })  : _packageInfoSource = packageInfoSource,
        _deviceInfoSource = deviceInfoSource,
        _deviceIdSource = deviceIdSource;

  final IPackageInfoPlatformDatasource _packageInfoSource;
  final IDeviceInfoPlatformDatasource _deviceInfoSource;
  final IDeviceIdPlatformDatasource _deviceIdSource;

  AppInfoEntity? _cachedAppInfo;
  @override
  Future<AppInfoEntity> fetch() async {
    final packageInfo = await _packageInfoSource.fetch();
    final deviceInfo = await _deviceInfoSource.fetch();
    final deviceId = await _deviceIdSource.fetchDeviceId();
    return _cachedAppInfo ??= AppInfoEntity(
      deviceId: deviceId,
      device: deviceInfo,
      package: packageInfo,
    );
  }
}

import 'package:app_info/src/data/data.dart';
import 'package:app_info/src/domain/domain.dart';

abstract interface class IPackageInfoPlatformDatasource {
  Future<PackageInfoEntity> fetch();
}

final class PackageInfoPlatformDatasourceImpl
    implements IPackageInfoPlatformDatasource {
  const PackageInfoPlatformDatasourceImpl(
      {required IPackageInfoPlusClient client})
      : _client = client;

  final IPackageInfoPlusClient _client;

  @override
  Future<PackageInfoEntity> fetch() async {
    final data = await _client.fetch();
    return PackageInfoMapper.toEntity(from: data);
  }
}

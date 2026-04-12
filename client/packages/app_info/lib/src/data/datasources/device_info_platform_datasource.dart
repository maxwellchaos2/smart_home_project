import 'package:app_info/src/data/data.dart';
import 'package:app_info/src/domain/domain.dart';

abstract interface class IDeviceInfoPlatformDatasource {
  Future<DeviceInfoEntity> fetch();
}

final class DeviceInfoPlatformDatasourceImpl
    implements IDeviceInfoPlatformDatasource {
  const DeviceInfoPlatformDatasourceImpl(
      {required IDeviceInfoPlusClient client})
      : _client = client;

  final IDeviceInfoPlusClient _client;

  @override
  Future<DeviceInfoEntity> fetch() async {
    final data = await _client.fetch();
    return DeviceInfoMapper.toEntity(from: data);
  }
}

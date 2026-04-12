import 'package:device_positions/src/data/data.dart';
import 'package:device_positions/src/domain/domain.dart';

final class DevicePositionsRepositoryImpl
    implements IDevicePositionsRepository {
  const DevicePositionsRepositoryImpl({
    required IDevicePositionsRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IDevicePositionsRemoteDatasource _remoteSource;

  @override
  Future<List<DevicePositionEntity>> fetchAll() async {
    return _remoteSource.fetchAll();
  }
}

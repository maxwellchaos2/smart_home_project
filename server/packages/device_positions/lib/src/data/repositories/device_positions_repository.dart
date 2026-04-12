import 'package:device_positions/src/data/data.dart';
import 'package:device_positions/src/domain/domain.dart';

final class DevicePositionsRepositoryImpl
    implements IDevicePositionsRepository {
  const DevicePositionsRepositoryImpl({
    required IDevicePositionsDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IDevicePositionsDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<List<DevicePositionEntity>> fetchAll({int? userId}) async {
    return await _databaseSource.fetchAll(userId: userId);
  }

  @override
  Future<DevicePositionEntity> create(
      {required DevicePositionInputEntity input}) async {
    return await _databaseSource.createDevicePosition(input: input);
  }

  @override
  Future<DevicePositionEntity> update(
      {required int id, required DevicePositionInputEntity input}) async {
    return await _databaseSource.updateDevicePosition(id: id, room: input);
  }

  @override
  Future<void> delete({required int id}) async {
    await _databaseSource.deleteDevicePosition(id: id);
  }
}

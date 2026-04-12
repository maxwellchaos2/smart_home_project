import 'package:device_positions/src/data/data.dart';
import 'package:device_positions/src/domain/domain.dart';

abstract interface class IDevicePositionsDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<DevicePositionEntity>> fetchAll({int? userId});

  Future<DevicePositionEntity> createDevicePosition(
      {required DevicePositionInputEntity input});

  Future<DevicePositionEntity> updateDevicePosition(
      {required int id, required DevicePositionInputEntity room});

  Future<void> deleteDevicePosition({required int id});
}

final class DevicePositionsDatabaseDatasourceImpl
    implements IDevicePositionsDatabaseDatasource {
  const DevicePositionsDatabaseDatasourceImpl(
      {required IDevicePositionsDatabaseClient client})
      : _client = client;

  final IDevicePositionsDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<DevicePositionEntity>> fetchAll({int? userId}) async {
    final rooms = await _client.fetchAll(userId: userId);
    return rooms
        .map((room) => DevicePositionMapper.toEntity(from: room))
        .toList();
  }

  @override
  Future<DevicePositionEntity> createDevicePosition(
      {required DevicePositionInputEntity input}) async {
    final room = await _client.createDevicePosition(
      input: DevicePositionInputMapper.toModel(from: input),
    );
    return DevicePositionMapper.toEntity(from: room);
  }

  @override
  Future<DevicePositionEntity> updateDevicePosition(
      {required int id, required DevicePositionInputEntity room}) async {
    final updatedDevicePosition = await _client.updateDevicePosition(
      id: id,
      room: DevicePositionInputMapper.toModel(from: room),
    );
    return DevicePositionMapper.toEntity(from: updatedDevicePosition);
  }

  @override
  Future<void> deleteDevicePosition({required int id}) async {
    await _client.deleteDevicePosition(id: id);
  }
}

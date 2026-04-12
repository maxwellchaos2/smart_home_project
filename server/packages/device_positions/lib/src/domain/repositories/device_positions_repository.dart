import 'package:device_positions/src/domain/domain.dart';

abstract interface class IDevicePositionsRepository {
  Future<bool> createTableIfNotExists();

  Future<List<DevicePositionEntity>> fetchAll({int? userId});

  Future<DevicePositionEntity> create(
      {required DevicePositionInputEntity input});

  Future<DevicePositionEntity> update(
      {required int id, required DevicePositionInputEntity input});

  Future<void> delete({required int id});
}

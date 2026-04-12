import 'package:device_scenario/src/domain/domain.dart';

abstract interface class IDeviceScenarioRepository {
  Future<bool> createTableIfNotExists();

  Future<List<DeviceScenarioEntity>> fetchAll({int? projectId});

  Future<DeviceScenarioEntity?> fetchById({required int id});

  Future<DeviceScenarioEntity> create(
      {required DeviceScenarioInputEntity input});

  Future<DeviceScenarioEntity> update(
      {required int id, required DeviceScenarioInputEntity input});

  Future<void> delete({required int id});
}

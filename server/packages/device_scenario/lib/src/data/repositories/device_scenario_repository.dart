import 'package:device_scenario/src/data/data.dart';
import 'package:device_scenario/src/domain/domain.dart';

final class DeviceScenarioRepositoryImpl implements IDeviceScenarioRepository {
  const DeviceScenarioRepositoryImpl({
    required IDeviceScenarioDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IDeviceScenarioDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<List<DeviceScenarioEntity>> fetchAll({int? projectId}) async {
    return await _databaseSource.fetchAll(projectId: projectId);
  }

  @override
  Future<DeviceScenarioEntity?> fetchById({required int id}) async {
    return await _databaseSource.fetchById(id: id);
  }

  @override
  Future<DeviceScenarioEntity> create(
      {required DeviceScenarioInputEntity input}) async {
    return await _databaseSource.createScenario(input: input);
  }

  @override
  Future<DeviceScenarioEntity> update(
      {required int id, required DeviceScenarioInputEntity input}) async {
    return await _databaseSource.updateScenario(id: id, input: input);
  }

  @override
  Future<void> delete({required int id}) async {
    await _databaseSource.deleteScenario(id: id);
  }
}

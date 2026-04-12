import 'package:device_scenario/src/data/data.dart';
import 'package:device_scenario/src/domain/domain.dart';

abstract interface class IDeviceScenarioDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<DeviceScenarioEntity>> fetchAll({int? projectId});

  Future<DeviceScenarioEntity?> fetchById({required int id});

  Future<DeviceScenarioEntity> createScenario(
      {required DeviceScenarioInputEntity input});

  Future<DeviceScenarioEntity> updateScenario(
      {required int id, required DeviceScenarioInputEntity input});

  Future<void> deleteScenario({required int id});
}

final class DeviceScenarioDatabaseDatasourceImpl
    implements IDeviceScenarioDatabaseDatasource {
  const DeviceScenarioDatabaseDatasourceImpl(
      {required IDeviceScenarioDatabaseClient client})
      : _client = client;

  final IDeviceScenarioDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<DeviceScenarioEntity>> fetchAll({int? projectId}) async {
    final scenarios = await _client.fetchAll(projectId: projectId);
    return scenarios
        .map((scenario) => DeviceScenarioMapper.toEntity(from: scenario))
        .toList();
  }

  @override
  Future<DeviceScenarioEntity?> fetchById({required int id}) async {
    final scenario = await _client.fetchById(id: id);
    if (scenario == null) return null;
    return DeviceScenarioMapper.toEntity(from: scenario);
  }

  @override
  Future<DeviceScenarioEntity> createScenario(
      {required DeviceScenarioInputEntity input}) async {
    final scenario = await _client.createScenario(
      input: DeviceScenarioInputMapper.toModel(from: input),
    );
    return DeviceScenarioMapper.toEntity(from: scenario);
  }

  @override
  Future<DeviceScenarioEntity> updateScenario(
      {required int id, required DeviceScenarioInputEntity input}) async {
    final scenario = await _client.updateScenario(
      id: id,
      input: DeviceScenarioInputMapper.toModel(from: input),
    );
    return DeviceScenarioMapper.toEntity(from: scenario);
  }

  @override
  Future<void> deleteScenario({required int id}) async {
    await _client.deleteScenario(id: id);
  }
}

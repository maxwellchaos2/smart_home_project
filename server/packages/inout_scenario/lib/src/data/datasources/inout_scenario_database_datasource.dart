import 'package:inout_scenario/src/data/data.dart';
import 'package:inout_scenario/src/domain/domain.dart';

abstract interface class IInOutScenarioDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<InOutScenarioEntity>> fetchAll({int? projectId});

  Future<InOutScenarioEntity> createScenario(
      {required InOutScenarioInputEntity input});

  Future<InOutScenarioEntity> updateScenario(
      {required int id, required InOutScenarioInputEntity input});

  Future<void> deleteScenario({required int id});

  Future fetch({required int id});
}

final class InOutScenarioDatabaseDatasourceImpl
    implements IInOutScenarioDatabaseDatasource {
  const InOutScenarioDatabaseDatasourceImpl(
      {required IInOutScenarioDatabaseClient client})
      : _client = client;

  final IInOutScenarioDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<InOutScenarioEntity>> fetchAll({int? projectId}) async {
    final scenarios = await _client.fetchAll(projectId: projectId);
    return scenarios
        .map((scenario) => InOutScenarioMapper.toEntity(from: scenario))
        .toList();
  }

  @override
  Future<InOutScenarioEntity> createScenario(
      {required InOutScenarioInputEntity input}) async {
    final scenario = await _client.createScenario(
      input: InOutScenarioInputMapper.toModel(from: input),
    );
    return InOutScenarioMapper.toEntity(from: scenario);
  }

  @override
  Future<InOutScenarioEntity> updateScenario(
      {required int id, required InOutScenarioInputEntity input}) async {
    final scenario = await _client.updateScenario(
      id: id,
      input: InOutScenarioInputMapper.toModel(from: input),
    );
    return InOutScenarioMapper.toEntity(from: scenario);
  }

  @override
  Future<void> deleteScenario({required int id}) async {
    await _client.deleteScenario(id: id);
  }

  @override
  Future fetch({required int id}) async {
    return await _client.fetch(id: id);
  }
}

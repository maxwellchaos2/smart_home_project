import 'package:inout_scenario/src/data/data.dart';
import 'package:inout_scenario/src/domain/domain.dart';

final class InOutScenarioRepositoryImpl implements IInOutScenarioRepository {
  const InOutScenarioRepositoryImpl({
    required IInOutScenarioDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IInOutScenarioDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<List<InOutScenarioEntity>> fetchAll({int? projectId}) async {
    return await _databaseSource.fetchAll(projectId: projectId);
  }

  @override
  Future<InOutScenarioEntity> create(
      {required InOutScenarioInputEntity input}) async {
    return await _databaseSource.createScenario(input: input);
  }

  @override
  Future<InOutScenarioEntity> update(
      {required int id, required InOutScenarioInputEntity input}) async {
    return await _databaseSource.updateScenario(id: id, input: input);
  }

  @override
  Future<void> delete({required int id}) async {
    await _databaseSource.deleteScenario(id: id);
  }

  @override
  Future fetch({required int id}) async {
    return await _databaseSource.fetch(id: id);
  }
}

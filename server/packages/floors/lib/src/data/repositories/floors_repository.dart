import 'package:floors/src/data/data.dart';
import 'package:floors/src/domain/domain.dart';

final class FloorsRepositoryImpl implements IFloorsRepository {
  const FloorsRepositoryImpl({
    required IFloorsDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IFloorsDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<List<FloorEntity>> fetchAll({required int projectId}) async {
    return await _databaseSource.fetchAll(projectId: projectId);
  }

  @override
  Future<FloorEntity> create({required FloorInputEntity input}) async {
    return await _databaseSource.createFloor(input: input);
  }
}

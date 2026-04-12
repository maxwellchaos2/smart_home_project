import 'package:floors/src/data/data.dart';
import 'package:floors/src/domain/domain.dart';

abstract interface class IFloorsDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<FloorEntity>> fetchAll({required int projectId});

  Future<FloorEntity> createFloor({required FloorInputEntity input});
}

final class FloorsDatabaseDatasourceImpl implements IFloorsDatabaseDatasource {
  const FloorsDatabaseDatasourceImpl({required IFloorsDatabaseClient client})
      : _client = client;

  final IFloorsDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<FloorEntity>> fetchAll({required int projectId}) async {
    final floors = await _client.fetchAll(projectId: projectId);
    return floors.map((floor) => FloorMapper.toEntity(from: floor)).toList();
  }

  @override
  Future<FloorEntity> createFloor({required FloorInputEntity input}) async {
    final floor = await _client.createFloor(
      input: FloorInputMapper.toModel(from: input),
    );
    return FloorMapper.toEntity(from: floor);
  }
}

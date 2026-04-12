import 'package:floors/src/data/data.dart';
import 'package:floors/src/domain/domain.dart';

final class FloorsRepositoryImpl implements IFloorsRepository {
  const FloorsRepositoryImpl({
    required IFloorsRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IFloorsRemoteDatasource _remoteSource;

  @override
  Future<List<FloorEntity>> fetchAll({
    required int projectId,
  }) {
    return _remoteSource.fetchAll(projectId: projectId);
  }

  @override
  Future<FloorEntity> create({
    required FloorInputEntity input,
    required int projectId,
  }) {
    return _remoteSource.create(input: input, projectId: projectId);
  }
}

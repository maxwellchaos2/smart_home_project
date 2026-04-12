import 'package:projects/src/data/data.dart';
import 'package:projects/src/domain/domain.dart';

final class ProjectsRepositoryImpl implements IProjectsRepository {
  const ProjectsRepositoryImpl({
    required IProjectsDatabaseDatasource databaseSource,
  }) : _databaseSource = databaseSource;

  final IProjectsDatabaseDatasource _databaseSource;

  @override
  Future<bool> createTableIfNotExists() async {
    final created = await _databaseSource.tableExists();
    if (created) return false;
    return await _databaseSource.createTable();
  }

  @override
  Future<ProjectEntity> fetch({
    required int id,
  }) async {
    return await _databaseSource.fetch(id: id);
  }

  @override
  Future<List<ProjectEntity>> fetchAll({
    required int userId,
  }) async {
    return await _databaseSource.fetchAll(userId: userId);
  }

  @override
  Future<ProjectEntity> create({
    required ProjectInputEntity input,
  }) async {
    return await _databaseSource.createProject(input: input);
  }

  Future<ProjectEntity?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  }) async {
    return await _databaseSource.updateYandexAuth(
      id: id,
      hasYandexAuth: hasYandexAuth,
    );
  }
}

import 'package:projects/src/data/data.dart';
import 'package:projects/src/domain/domain.dart';

abstract interface class IProjectsDatabaseDatasource {
  Future<bool> tableExists();
  Future<bool> createTable();

  Future<List<ProjectEntity>> fetchAll({required int userId});
  Future<ProjectEntity> fetch({required int id});

  Future<ProjectEntity> createProject({required ProjectInputEntity input});

  Future<ProjectEntity?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  });
}

final class ProjectsDatabaseDatasourceImpl
    implements IProjectsDatabaseDatasource {
  const ProjectsDatabaseDatasourceImpl(
      {required IProjectsDatabaseClient client})
      : _client = client;

  final IProjectsDatabaseClient _client;

  @override
  Future<bool> tableExists() async {
    return await _client.tableExists();
  }

  @override
  Future<bool> createTable() async {
    return await _client.createTable();
  }

  @override
  Future<List<ProjectEntity>> fetchAll({required int userId}) async {
    final projects = await _client.fetchAll(userId: userId);
    return projects
        .map((project) => ProjectMapper.toEntity(from: project))
        .toList();
  }

  @override
  Future<ProjectEntity> fetch({required int id}) async {
    final project = await _client.fetch(id: id);
    return ProjectMapper.toEntity(from: project);
  }

  @override
  Future<ProjectEntity> createProject(
      {required ProjectInputEntity input}) async {
    final project = await _client.createProject(
      input: ProjectInputMapper.toModel(from: input),
    );
    return ProjectMapper.toEntity(from: project);
  }

  @override
  Future<ProjectEntity?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  }) async {
    final project = await _client.updateYandexAuth(
      id: id,
      hasYandexAuth: hasYandexAuth,
    );
    if (project == null) return null;
    return ProjectMapper.toEntity(from: project);
  }
}

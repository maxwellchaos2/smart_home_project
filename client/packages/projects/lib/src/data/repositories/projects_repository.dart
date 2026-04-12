import 'package:projects/src/data/data.dart';
import 'package:projects/src/domain/domain.dart';

final class ProjectsRepositoryImpl implements IProjectsRepository {
  const ProjectsRepositoryImpl(
      {required IProjectsRemoteDatasource remoteSource})
      : _remoteSource = remoteSource;

  final IProjectsRemoteDatasource _remoteSource;

  @override
  Future<ProjectEntity> fetch() async {
    return await _remoteSource.fetch();
  }
}

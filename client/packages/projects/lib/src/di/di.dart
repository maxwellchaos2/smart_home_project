import 'package:common/common.dart';
import 'package:projects/src/data/data.dart';
import 'package:projects/src/domain/domain.dart';

abstract final class ProjectsDI {
  static Future<void> init({required GetIt locator}) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IProjectsRepository getRepo({required GetIt locator}) {
    return ProjectsRepositoryImpl(
      remoteSource: ProjectsRemoteDatasourceImpl(
        client: ProjectsApiClient(locator.get()),
      ),
    );
  }
}

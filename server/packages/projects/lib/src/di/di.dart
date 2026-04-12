import 'package:common/common.dart';
import 'package:projects/projects.dart';
import 'package:projects/src/data/data.dart';

abstract final class ProjectsDI {
  static Future<void> init({
    required GetIt locator,
  }) async {
    locator.registerLazySingleton(() => getRepo(locator: locator));
  }

  static IProjectsRepository getRepo({
    required GetIt locator,
  }) {
    return ProjectsRepositoryImpl(
      databaseSource: ProjectsDatabaseDatasourceImpl(
        client: ProjectsDatabaseClientImpl(
          database: locator.get(),
        ),
      ),
    );
  }
}

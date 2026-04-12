library;

import 'package:common/common.dart';
import 'package:projects/src/application/application.dart';
import 'package:projects/src/di/di.dart';
import 'package:shelf_router/shelf_router.dart';

export 'src/application/application.dart' show checkProjectMiddleware;
export 'src/domain/domain.dart' show IProjectsRepository, ProjectEntity;

abstract final class ProjectsModule {
  static Future<void> init({
    required GetIt locator,
    required Router router,
  }) async {
    registerRouterHandlers(router);

    await ProjectsDI.init(
      locator: locator,
    );
  }
}

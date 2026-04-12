import 'package:shelf_router/shelf_router.dart';

import 'create_project_handler.dart';
import 'fetch_my_projects_handler.dart';

void registerRouterHandlers(Router router) {
  router.post('/api/projects/create', createProjectHandler);
  router.get('/api/projects', fetchMyProjectsHandler);
}

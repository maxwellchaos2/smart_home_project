import 'package:shelf_router/shelf_router.dart';

import 'create_in_out_scenario_handler.dart';
import 'delete_in_out_scenario_handler.dart';
import 'fetch_in_out_scenarios_handler.dart';
import 'update_in_out_scenario_handler.dart';

void registerRouterHandlers(Router router) {
  router.get(
      '/api/projects/<projectId>/inout_scenarios', fetchInOutScenariosHandler);
  router.post('/api/projects/<projectId>/inout_scenarios/create',
      createInOutScenarioHandler);
  router.put('/api/projects/<projectId>/inout_scenarios/<id>/update',
      updateInOutScenarioHandler);
  router.delete('/api/projects/<projectId>/inout_scenarios/<id>/delete',
      deleteInOutScenarioHandler);
}

import 'package:device_scenario/src/application/handlers/run_device_scenario_handler.dart';
import 'package:shelf_router/shelf_router.dart';

import 'create_device_scenario_handler.dart';
import 'delete_device_scenario_handler.dart';
import 'fetch_device_scenario_handler.dart';
import 'fetch_device_scenarios_handler.dart';
import 'update_device_scenario_handler.dart';

void registerRouterHandlers(Router router) {
  router.get('/api/projects/<projectId>/device_scenarios',
      fetchDeviceScenariosHandler);
  router.get('/api/projects/<projectId>/device_scenarios/<id>',
      fetchDeviceScenarioHandler);
  router.post('/api/projects/<projectId>/device_scenarios/create',
      createDeviceScenarioHandler);
  router.put('/api/projects/<projectId>/device_scenarios/<id>/update',
      updateDeviceScenarioHandler);
  router.delete('/api/projects/<projectId>/device_scenarios/<id>/delete',
      deleteDeviceScenarioHandler);

  router.post('/api/projects/<projectId>/device_scenarios/<id>/run',
      runDeviceScenarioHandler);
}

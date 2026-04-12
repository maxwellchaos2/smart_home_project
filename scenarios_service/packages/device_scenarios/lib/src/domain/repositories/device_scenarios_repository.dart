import 'package:device_scenarios/src/domain/domain.dart';

abstract interface class IDeviceScenariosRepository {
  Future<List<DeviceScenarioEntity>> fetchAll({
    required int projectId,
  });
  Future<DeviceScenarioEntity?> fetch({
    required int id,
    required int projectId,
  });
}

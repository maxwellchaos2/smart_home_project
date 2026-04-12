import 'package:common/common.dart';
import 'package:device_scenarios/src/domain/domain.dart';

abstract interface class IDeviceScenariosRepository {
  Future<List<DeviceScenarioEntity>> fetchAll({required int projectId});

  Future<DeviceScenarioEntity> create(
      {required int projectId, required DeviceScenarioInputEntity input});

  Future<DeviceScenarioEntity> update(
      {required int id,
      required int projectId,
      required DeviceScenarioInputEntity input});

  Future<void> run({required int id, required int projectId});

  Future<void> delete({required int id, required int projectId});

  Stream<ChangedEvent<DeviceScenarioEntity>> get onChanged;

  void dispose();
}

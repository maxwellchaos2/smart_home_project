import 'dart:async';

import 'package:common/common.dart';
import 'package:device_scenarios/src/data/data.dart';
import 'package:device_scenarios/src/domain/domain.dart';

final class DeviceScenariosRepositoryImpl
    with DeviceScenariosRepositoryChangedMixin
    implements IDeviceScenariosRepository {
  DeviceScenariosRepositoryImpl({
    required IDeviceScenariosRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IDeviceScenariosRemoteDatasource _remoteSource;

  @override
  Future<List<DeviceScenarioEntity>> fetchAll({required int projectId}) async {
    return _remoteSource.fetchAll(projectId: projectId);
  }

  @override
  Future<DeviceScenarioEntity> create(
      {required int projectId,
      required DeviceScenarioInputEntity input}) async {
    final data = await _remoteSource.create(projectId: projectId, input: input);
    _changedController.add(ChangedEvent.created(data));
    return data;
  }

  @override
  Future<void> delete({required int id, required int projectId}) async {
    await _remoteSource.delete(id: id, projectId: projectId);
    _changedController.add(ChangedEvent.deleted(itemId: id));
  }

  @override
  Future<DeviceScenarioEntity> update(
      {required int id,
      required int projectId,
      required DeviceScenarioInputEntity input}) async {
    final data =
        await _remoteSource.update(id: id, projectId: projectId, input: input);
    _changedController.add(ChangedEvent.updated(data));
    return data;
  }

  @override
  Future<void> run({required int id, required int projectId}) async {
    await _remoteSource.run(id: id, projectId: projectId);
  }
}

mixin DeviceScenariosRepositoryChangedMixin
    implements IDeviceScenariosRepository {
  final _changedController =
      StreamController<ChangedEvent<DeviceScenarioEntity>>.broadcast();

  @override
  Stream<ChangedEvent<DeviceScenarioEntity>> get onChanged =>
      _changedController.stream;

  @override
  void dispose() {
    _changedController.close();
  }
}

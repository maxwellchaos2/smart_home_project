import 'dart:async';

import 'package:device_scenarios/src/data/data.dart';
import 'package:device_scenarios/src/domain/domain.dart';

final class DeviceScenariosRepositoryImpl
    implements IDeviceScenariosRepository {
  DeviceScenariosRepositoryImpl({
    required IDeviceScenariosRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IDeviceScenariosRemoteDatasource _remoteSource;

  @override
  Future<List<DeviceScenarioEntity>> fetchAll({
    required int projectId,
  }) async {
    return _remoteSource.fetchAll(projectId: projectId);
  }

  @override
  Future<DeviceScenarioEntity?> fetch({
    required int id,
    required int projectId,
  }) async {
    return _remoteSource.fetch(id: id, projectId: projectId);
  }
}

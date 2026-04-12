import 'package:device_scenarios/src/data/data.dart';
import 'package:device_scenarios/src/domain/domain.dart';

abstract interface class IDeviceScenariosRemoteDatasource {
  Future<List<DeviceScenarioEntity>> fetchAll({
    required int projectId,
  });

  Future<DeviceScenarioEntity?> fetch({
    required int id,
    required int projectId,
  });
}

final class DeviceScenariosRemoteDatasourceImpl
    implements IDeviceScenariosRemoteDatasource {
  const DeviceScenariosRemoteDatasourceImpl(
      {required DeviceScenariosApiClient client})
      : _client = client;

  final DeviceScenariosApiClient _client;

  @override
  Future<List<DeviceScenarioEntity>> fetchAll({
    required int projectId,
  }) async {
    final data = await _client.fetchAll(projectId: projectId);
    return data.map((e) => DeviceScenarioMapper.toEntity(from: e)).toList();
  }

  @override
  Future<DeviceScenarioEntity?> fetch({
    required int id,
    required int projectId,
  }) async {
    final data = await _client.fetch(id: id, projectId: projectId);
    return DeviceScenarioMapper.toEntity(from: data);
  }
}

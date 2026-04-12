import 'package:common/common.dart';
import 'package:device_scenarios/src/data/data.dart';
import 'package:device_scenarios/src/domain/domain.dart';
import 'package:dio/dio.dart';

abstract interface class IDeviceScenariosRemoteDatasource {
  Future<List<DeviceScenarioEntity>> fetchAll({
    required int projectId,
  });
  Future<DeviceScenarioEntity> create({
    required int projectId,
    required DeviceScenarioInputEntity input,
  });
  Future<DeviceScenarioEntity> update({
    required int id,
    required int projectId,
    required DeviceScenarioInputEntity input,
  });
  Future<void> delete({required int id, required int projectId});
  Future<void> run({required int id, required int projectId});
}

final class DeviceScenariosRemoteDatasourceImpl
    implements IDeviceScenariosRemoteDatasource {
  const DeviceScenariosRemoteDatasourceImpl(
      {required DeviceScenariosApiClient client})
      : _client = client;

  final DeviceScenariosApiClient _client;

  @override
  Future<List<DeviceScenarioEntity>> fetchAll({required int projectId}) async {
    try {
      final data = await _client.fetchAll(projectId: projectId);
      return data.map((e) => DeviceScenarioMapper.toEntity(from: e)).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<DeviceScenarioEntity> create(
      {required int projectId,
      required DeviceScenarioInputEntity input}) async {
    try {
      final data = await _client.create(
          projectId: projectId,
          input: DeviceScenarioInputMapper.toModel(from: input));
      return DeviceScenarioMapper.toEntity(from: data);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<DeviceScenarioEntity> update(
      {required int id,
      required int projectId,
      required DeviceScenarioInputEntity input}) async {
    try {
      final data = await _client.update(
          id: id,
          projectId: projectId,
          input: DeviceScenarioInputMapper.toModel(from: input));
      return DeviceScenarioMapper.toEntity(from: data);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<void> delete({required int id, required int projectId}) async {
    try {
      await _client.delete(id: id, projectId: projectId);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<void> run({required int id, required int projectId}) async {
    try {
      await _client.run(id: id, projectId: projectId);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}

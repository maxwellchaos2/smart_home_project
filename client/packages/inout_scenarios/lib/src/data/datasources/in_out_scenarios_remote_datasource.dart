import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:inout_scenarios/src/data/data.dart';
import 'package:inout_scenarios/src/domain/domain.dart';

abstract interface class IInOutScenariosRemoteDatasource {
  Future<List<InOutScenarioEntity>> fetchAll({
    required int projectId,
  });
  Future<InOutScenarioEntity> create({
    required int projectId,
    required InOutScenarioInputEntity input,
  });
  Future<InOutScenarioEntity> update({
    required int projectId,
    required int id,
    required InOutScenarioInputEntity input,
  });
  Future<void> delete({
    required int projectId,
    required int id,
  });
}

final class InOutScenariosRemoteDatasourceImpl
    implements IInOutScenariosRemoteDatasource {
  const InOutScenariosRemoteDatasourceImpl(
      {required InOutScenariosApiClient client})
      : _client = client;

  final InOutScenariosApiClient _client;

  @override
  Future<List<InOutScenarioEntity>> fetchAll({
    required int projectId,
  }) async {
    try {
      final data = await _client.fetchAll(projectId: projectId);
      return data.map((e) => InOutScenarioMapper.toEntity(from: e)).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<InOutScenarioEntity> create(
      {required InOutScenarioInputEntity input, required int projectId}) async {
    try {
      final data = await _client.create(
          input: InOutScenarioInputMapper.toModel(from: input),
          projectId: projectId);
      return InOutScenarioMapper.toEntity(from: data);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<InOutScenarioEntity> update(
      {required int projectId,
      required int id,
      required InOutScenarioInputEntity input}) async {
    try {
      final data = await _client.update(
          projectId: projectId,
          id: id,
          input: InOutScenarioInputMapper.toModel(from: input));
      return InOutScenarioMapper.toEntity(from: data);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<void> delete({required int projectId, required int id}) async {
    try {
      await _client.delete(projectId: projectId, id: id);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}

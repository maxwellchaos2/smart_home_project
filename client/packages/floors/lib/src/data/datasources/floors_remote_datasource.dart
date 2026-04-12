import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:floors/src/data/data.dart';
import 'package:floors/src/domain/domain.dart';

abstract interface class IFloorsRemoteDatasource {
  Future<List<FloorEntity>> fetchAll({
    required int projectId,
  });

  Future<FloorEntity> create({
    required FloorInputEntity input,
    required int projectId,
  });
}

final class FloorsRemoteDatasourceImpl implements IFloorsRemoteDatasource {
  const FloorsRemoteDatasourceImpl({required FloorsApiClient client})
      : _client = client;

  final FloorsApiClient _client;

  @override
  Future<List<FloorEntity>> fetchAll({
    required int projectId,
  }) async {
    try {
      final data = await _client.fetchAll(projectId: projectId);
      return data.map((e) => FloorMapper.toEntity(from: e)).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }

  @override
  Future<FloorEntity> create({
    required FloorInputEntity input,
    required int projectId,
  }) async {
    try {
      final inputModel = FloorInputMapper.toModel(from: input);
      final data = await _client.create(
        projectId: projectId,
        input: inputModel,
      );
      return FloorMapper.toEntity(from: data);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}

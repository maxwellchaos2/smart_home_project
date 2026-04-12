import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:projects/src/data/data.dart';
import 'package:projects/src/domain/domain.dart';

abstract interface class IProjectsRemoteDatasource {
  Future<ProjectEntity> fetch();
}

final class ProjectsRemoteDatasourceImpl implements IProjectsRemoteDatasource {
  const ProjectsRemoteDatasourceImpl({required ProjectsApiClient client})
      : _client = client;

  final ProjectsApiClient _client;

  @override
  Future<ProjectEntity> fetch() async {
    try {
      final result = await _client.fetch();
      return ProjectMapper.toEntity(from: result.first);
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}

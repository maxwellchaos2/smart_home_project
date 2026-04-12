import 'package:projects/src/domain/domain.dart';

abstract interface class IProjectsRepository {
  Future<bool> createTableIfNotExists();

  Future<ProjectEntity> fetch({
    required int id,
  });

  Future<List<ProjectEntity>> fetchAll({
    required int userId,
  });

  Future<ProjectEntity> create({
    required ProjectInputEntity input,
  });

  Future<ProjectEntity?> updateYandexAuth({
    required int id,
    required bool hasYandexAuth,
  });
}

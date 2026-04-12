import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class ProjectMapper {
  static ProjectEntity toEntity({required ProjectModel from}) {
    return ProjectEntity(
      id: from.id,
      name: from.name,
      createdAt: from.createdAt,
      hasYandexAuth: from.hasYandexAuth,
    );
  }
}

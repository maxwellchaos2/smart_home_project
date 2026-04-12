import 'package:projects/src/application/application.dart';
import 'package:projects/src/domain/domain.dart';

abstract final class ProjectResponseMapper {
  static ProjectResponseModel toModel({required ProjectEntity from}) {
    return ProjectResponseModel(
      id: from.id,
      name: from.name,
      createdAt: from.createdAt,
      hasYandexAuth: from.hasYandexAuth,
    );
  }
}

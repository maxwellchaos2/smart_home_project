import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class ProjectInputMapper {
  static ProjectInputModel toModel({required ProjectInputEntity from}) {
    return ProjectInputModel(
      name: from.name,
      userId: from.userId,
    );
  }
}

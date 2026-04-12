import 'package:projects/src/application/application.dart';
import 'package:projects/src/domain/domain.dart';

abstract final class CreateProjectRequestMapper {
  static ProjectInputEntity toEntity(
      {required CreateProjectRequestModel from, required int userId}) {
    return ProjectInputEntity(
      name: from.name,
      userId: userId,
    );
  }
}

import 'package:floors/src/application/application.dart';
import 'package:floors/src/domain/domain.dart';

abstract final class CreateFloorRequestMapper {
  static FloorInputEntity toEntity(
      {required CreateFloorRequestModel from,
      required int projectId,
      required String planMediaPath}) {
    return FloorInputEntity(
      name: from.name,
      projectId: projectId,
      planMediaPath: planMediaPath,
    );
  }
}

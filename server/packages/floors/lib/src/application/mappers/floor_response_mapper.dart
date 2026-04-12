import 'package:floors/src/application/application.dart';
import 'package:floors/src/domain/domain.dart';

abstract final class FloorResponseMapper {
  static FloorResponseModel toModel({required FloorEntity from}) {
    return FloorResponseModel(
      id: from.id,
      name: from.name,
      projectId: from.projectId,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      planMediaPath: from.planMediaPath,
    );
  }
}

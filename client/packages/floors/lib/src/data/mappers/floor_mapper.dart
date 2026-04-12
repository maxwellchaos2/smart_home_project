import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class FloorMapper {
  static FloorEntity toEntity({required FloorModel from}) {
    return FloorEntity(
      id: from.id,
     name: from.name,
     projectId: from.projectId,
     createdAt: from.createdAt,
     updatedAt: from.updatedAt,
     planMediaPath: from.planMediaPath,
    );
  }
}

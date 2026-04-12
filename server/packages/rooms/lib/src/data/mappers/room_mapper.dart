import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class RoomMapper {
  static RoomEntity toEntity({required RoomModel from}) {
    return RoomEntity(
      id: from.id,
      name: from.name,
      floorId: from.floorId,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      planMediaPath: from.planMediaPath,
      projectId: from.projectId,
    );
  }

  static RoomModel toModel({required RoomEntity from}) {
    return RoomModel(
      id: from.id,
      name: from.name,
      floorId: from.floorId,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      planMediaPath: from.planMediaPath,
      projectId: from.projectId,
    );
  }
}

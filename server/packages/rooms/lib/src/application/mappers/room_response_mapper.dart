import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/domain/domain.dart';

abstract final class RoomResponseMapper {
  static RoomResponseModel toModel({required RoomEntity from}) {
    return RoomResponseModel(
      id: from.id,
      name: from.name,
      floorId: from.floorId,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      planMediaPath: from.planMediaPath,
    );
  }
}

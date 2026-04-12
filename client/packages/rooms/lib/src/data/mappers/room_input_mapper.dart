import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class RoomInputMapper {
  static RoomInputModel toModel({required RoomInputEntity from}) {
    return RoomInputModel(
      name: from.name,
     floorId: from.floorId,
     planMediaPath: from.planMediaPath,
    );
  }
}

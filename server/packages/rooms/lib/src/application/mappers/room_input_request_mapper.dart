import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/domain/domain.dart';

abstract final class RoomInputRequestMapper {
  static RoomInputEntity toEntity(
      {required RoomInputRequestModel from, String? planMediaPath}) {
    return RoomInputEntity(
      name: from.name,
      floorId: from.floorId,
      planMediaPath: planMediaPath,
    );
  }
}

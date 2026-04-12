import 'package:common/common.dart';

part 'room_input_entity.freezed.dart';

@freezed
sealed class RoomInputEntity with _$RoomInputEntity {
  const factory RoomInputEntity({
    required String name,
    required int floorId,
    required String? planMediaPath,
  }) = _RoomInputEntity;
}

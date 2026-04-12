import 'package:common/common.dart';

part 'room_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class RoomEntity with _$RoomEntity {
  const RoomEntity._();

  const factory RoomEntity({
    required int id,
    required String name,
    required int floorId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String? planMediaPath,
    required int projectId,
  }) = _RoomEntity;
}

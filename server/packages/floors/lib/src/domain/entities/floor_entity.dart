import 'package:common/common.dart';

part 'floor_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class FloorEntity with _$FloorEntity {
  const FloorEntity._();

  const factory FloorEntity({
    required int id,
    required String name,
    required int projectId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String? planMediaPath,
  }) = _FloorEntity;
}

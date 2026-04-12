import 'package:common/common.dart';

part 'floor_input_entity.freezed.dart';

@freezed
sealed class FloorInputEntity with _$FloorInputEntity {
  const factory FloorInputEntity({
    required String name,
    required int projectId,
    required String? planMediaPath,
  }) = _FloorInputEntity;
}

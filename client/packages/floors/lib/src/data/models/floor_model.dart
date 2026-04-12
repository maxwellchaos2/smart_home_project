import 'package:common/common.dart';

part 'floor_model.freezed.dart';
part 'floor_model.g.dart';

@Freezed(fromJson: true)
sealed class FloorModel with _$FloorModel {
  const FloorModel._();

  const factory FloorModel({
    required int id,
    required String name,
    required int projectId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String? planMediaPath,
  }) = _FloorModel;

  factory FloorModel.fromJson(Map<String, Object?> json) =>
      _$FloorModelFromJson(json);
}

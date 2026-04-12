import 'package:common/common.dart';

part 'floor_model.freezed.dart';
part 'floor_model.g.dart';

@Freezed(fromJson: true)
sealed class FloorModel with _$FloorModel {
  const FloorModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FloorModel({
    required int id,
    required String name,
    required int projectId,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime updatedAt,
    required String? planMediaPath,
  }) = _FloorModel;

  factory FloorModel.fromJson(Map<String, Object?> json) =>
      _$FloorModelFromJson(json);
}

DateTime dateTimeFromJson(DateTime value) {
  return value;
}

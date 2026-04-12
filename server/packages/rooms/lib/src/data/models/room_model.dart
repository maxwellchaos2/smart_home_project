import 'package:common/common.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@Freezed(fromJson: true)
sealed class RoomModel with _$RoomModel {
  const RoomModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RoomModel({
    required int id,
    required String name,
    required int floorId,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime updatedAt,
    required String? planMediaPath,
    required int projectId,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, Object?> json) =>
      _$RoomModelFromJson(json);
}

DateTime dateTimeFromJson(DateTime value) {
  return value;
}

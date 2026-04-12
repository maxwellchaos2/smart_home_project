import 'package:common/common.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@Freezed(fromJson: true)
sealed class RoomModel with _$RoomModel {
  const RoomModel._();

  const factory RoomModel({
    required int id,
    required String name,
    required int floorId,
    required String? planMediaPath,
  }) = _RoomModel;
  

  factory RoomModel.fromJson(Map<String, Object?> json) =>
      _$RoomModelFromJson(json);
}

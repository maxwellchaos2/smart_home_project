import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_response_model.freezed.dart';
part 'room_response_model.g.dart';

@Freezed(toJson: true)
class RoomResponseModel with _$RoomResponseModel {
  const RoomResponseModel._();

  const factory RoomResponseModel({
    required int id,
    required String name,
    required int floorId,
    required String? planMediaPath,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RoomResponseModel;

  @override
  Map<String, dynamic> toJson();
}

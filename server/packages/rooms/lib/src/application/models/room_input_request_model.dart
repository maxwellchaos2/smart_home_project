import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_input_request_model.freezed.dart';
part 'room_input_request_model.g.dart';

@Freezed(fromJson: true)
class RoomInputRequestModel with _$RoomInputRequestModel {
  const RoomInputRequestModel._();

  const factory RoomInputRequestModel({
    required String name,
    required int floorId,
  }) = _RoomInputRequestModel;

  factory RoomInputRequestModel.fromJson(Map<String, Object?> json) =>
      _$RoomInputRequestModelFromJson(json);
}

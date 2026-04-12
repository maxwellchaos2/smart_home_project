import 'package:common/common.dart';

part 'room_input_model.freezed.dart';
part 'room_input_model.g.dart';

@Freezed(toJson: true)
sealed class RoomInputModel with _$RoomInputModel {
  const RoomInputModel._();

  const factory RoomInputModel({
    required String name,
    required int floorId,
    required String? planMediaPath,
  }) = _RoomInputModel;
  
  @override
  Map<String, dynamic> toJson();
}

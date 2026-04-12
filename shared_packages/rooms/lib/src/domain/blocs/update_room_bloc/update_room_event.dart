part of 'update_room_bloc.dart';

@freezed
class UpdateRoomEvent with _$UpdateRoomEvent {
  const factory UpdateRoomEvent.update({
    required RoomInputEntity input,
  }) = _Update;
}

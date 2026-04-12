part of 'create_room_bloc.dart';

@freezed
class CreateRoomEvent with _$CreateRoomEvent {
  const factory CreateRoomEvent.create({
    required RoomInputEntity input,
  }) = _Create;
}

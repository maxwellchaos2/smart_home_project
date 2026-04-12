part of 'delete_room_bloc.dart';

@freezed
class DeleteRoomEvent with _$DeleteRoomEvent {
  const factory DeleteRoomEvent.delete() = _Delete;
}

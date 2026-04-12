part of 'create_room_bloc.dart';

@freezed
sealed class CreateRoomState with _$CreateRoomState {
  const CreateRoomState._();
  const factory CreateRoomState.initial() = _Initial;
  const factory CreateRoomState.loading() = _Loading;
  const factory CreateRoomState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory CreateRoomState.success({required RoomEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

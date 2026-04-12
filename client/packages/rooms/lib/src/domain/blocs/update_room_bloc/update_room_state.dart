part of 'update_room_bloc.dart';

@freezed
sealed class UpdateRoomState with _$UpdateRoomState {
  const UpdateRoomState._();
  const factory UpdateRoomState.initial() = _Initial;
  const factory UpdateRoomState.loading() = _Loading;
  const factory UpdateRoomState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory UpdateRoomState.success({required RoomEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

part of 'delete_room_bloc.dart';

@freezed
sealed class DeleteRoomState with _$DeleteRoomState {
  const DeleteRoomState._();
  const factory DeleteRoomState.initial() = _Initial;
  const factory DeleteRoomState.loading() = _Loading;
  const factory DeleteRoomState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DeleteRoomState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

part of 'rooms_bloc.dart';

@Freezed(copyWith: true)
sealed class RoomsState with _$RoomsState {
  const RoomsState._();
  const factory RoomsState.initial({List<RoomEntity>? data}) = _Initial;
  const factory RoomsState.loading({List<RoomEntity>? data}) = _Loading;
  const factory RoomsState.failure(
      {List<RoomEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory RoomsState.success({required List<RoomEntity> data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

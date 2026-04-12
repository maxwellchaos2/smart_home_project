part of 'rooms_bloc.dart';

@freezed
class RoomsEvent with _$RoomsEvent {
  const factory RoomsEvent.fetch() = _Fetch;

  @visibleForTesting
  const factory RoomsEvent.$changed({
    required List<ChangedEvent<RoomEntity>> events,
  }) = _Changed;
}

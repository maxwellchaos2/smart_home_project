part of 'open_door_bloc.dart';

@freezed
sealed class OpenDoorState with _$OpenDoorState {
  const OpenDoorState._();
  const factory OpenDoorState.initial() = _Initial;
  const factory OpenDoorState.loading() = _Loading;
  const factory OpenDoorState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory OpenDoorState.success({required bool data}) = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

part of 'close_door_bloc.dart';

@freezed
sealed class CloseDoorState with _$CloseDoorState {
  const CloseDoorState._();
  const factory CloseDoorState.initial() = _Initial;
  const factory CloseDoorState.loading() = _Loading;
  const factory CloseDoorState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory CloseDoorState.success({required bool data}) = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

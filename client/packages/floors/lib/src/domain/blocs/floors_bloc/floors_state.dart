part of 'floors_bloc.dart';

@freezed
sealed class FloorsState with _$FloorsState {
  const FloorsState._();
  const factory FloorsState.initial({List<FloorEntity>? data}) = _Initial;
  const factory FloorsState.loading({List<FloorEntity>? data}) = _Loading;
  const factory FloorsState.failure(
      {List<FloorEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory FloorsState.success({required List<FloorEntity> data}) =
      _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

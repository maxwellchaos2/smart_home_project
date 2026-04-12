part of 'isapi_events_bloc.dart';

@freezed
sealed class IsapiEventsState with _$IsapiEventsState {
  const IsapiEventsState._();
  const factory IsapiEventsState.initial({
    List<IsapiEventEntity>? data,
    @Default(true) bool hasMore,
  }) = _Initial;
  const factory IsapiEventsState.loading({
    List<IsapiEventEntity>? data,
    required bool hasMore,
  }) = _Loading;
  const factory IsapiEventsState.failure({
    List<IsapiEventEntity>? data,
    required bool hasMore,
    @Default(Failure.unknown()) Failure failure,
  }) = _Failure;
  const factory IsapiEventsState.success({
    required List<IsapiEventEntity> data,
    required bool hasMore,
  }) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

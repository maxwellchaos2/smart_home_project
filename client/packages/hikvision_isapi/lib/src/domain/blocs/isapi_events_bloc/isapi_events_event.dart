part of 'isapi_events_bloc.dart';

@freezed
class IsapiEventsEvent with _$IsapiEventsEvent {
  const factory IsapiEventsEvent.paginate() = _Paginate;

  const factory IsapiEventsEvent.refresh() = _Refresh;
}
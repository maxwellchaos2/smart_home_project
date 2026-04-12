part of 'app_info_bloc.dart';

@freezed
class AppInfoEvent with _$AppInfoEvent {
  const factory AppInfoEvent.fetch() = _Fetch;
}
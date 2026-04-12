part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.fetch() = _Fetch;
  const factory LocalizationEvent.update({required LocaleEntity locale}) =
      _Update;
}

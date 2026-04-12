part of 'localization_bloc.dart';

@freezed
sealed class LocalizationState with _$LocalizationState {
  const LocalizationState._();
  const factory LocalizationState.initial({LocaleEntity? data}) = _Initial;
  const factory LocalizationState.loading({LocaleEntity? data}) = _Loading;
  const factory LocalizationState.failure({LocaleEntity? data, @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory LocalizationState.success({required LocaleEntity data}) = _Success;
  
  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

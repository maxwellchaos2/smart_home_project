part of 'app_info_bloc.dart';

@freezed
sealed class AppInfoState with _$AppInfoState {
  const AppInfoState._();
  const factory AppInfoState.initial({AppInfoEntity? data}) = _Initial;
  const factory AppInfoState.loading({AppInfoEntity? data}) = _Loading;
  const factory AppInfoState.failure({AppInfoEntity? data, @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory AppInfoState.success({required AppInfoEntity data}) = _Success;
  
  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

part of 'project_bloc.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const ProjectState._();
  const factory ProjectState.initial({ProjectEntity? data}) = _Initial;
  const factory ProjectState.loading({ProjectEntity? data}) = _Loading;
  const factory ProjectState.failure({ProjectEntity? data, @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory ProjectState.success({required ProjectEntity data}) = _Success;
  
  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

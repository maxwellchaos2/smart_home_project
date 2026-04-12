part of 'update_in_out_scenario_bloc.dart';

@freezed
sealed class UpdateInOutScenarioState with _$UpdateInOutScenarioState {
  const UpdateInOutScenarioState._();
  const factory UpdateInOutScenarioState.initial() = _Initial;
  const factory UpdateInOutScenarioState.loading() = _Loading;
  const factory UpdateInOutScenarioState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory UpdateInOutScenarioState.success({required InOutScenarioEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

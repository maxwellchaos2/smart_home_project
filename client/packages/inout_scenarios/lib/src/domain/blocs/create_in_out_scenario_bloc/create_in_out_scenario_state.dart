part of 'create_in_out_scenario_bloc.dart';

@freezed
sealed class CreateInOutScenarioState with _$CreateInOutScenarioState {
  const CreateInOutScenarioState._();
  const factory CreateInOutScenarioState.initial() = _Initial;
  const factory CreateInOutScenarioState.loading() = _Loading;
  const factory CreateInOutScenarioState.failure({@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory CreateInOutScenarioState.success({required InOutScenarioEntity data}) = _Success;
  
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

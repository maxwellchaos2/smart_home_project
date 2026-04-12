part of 'delete_in_out_scenario_bloc.dart';

@freezed
sealed class DeleteInOutScenarioState with _$DeleteInOutScenarioState {
  const DeleteInOutScenarioState._();
  const factory DeleteInOutScenarioState.initial() = _Initial;
  const factory DeleteInOutScenarioState.loading() = _Loading;
  const factory DeleteInOutScenarioState.failure(
      {@Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory DeleteInOutScenarioState.success() = _Success;

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

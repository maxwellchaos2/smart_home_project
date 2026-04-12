part of 'in_out_scenarios_bloc.dart';

@Freezed(copyWith: true)
sealed class InOutScenariosState with _$InOutScenariosState {
  const InOutScenariosState._();
  const factory InOutScenariosState.initial({List<InOutScenarioEntity>? data}) =
      _Initial;
  const factory InOutScenariosState.loading({List<InOutScenarioEntity>? data}) =
      _Loading;
  const factory InOutScenariosState.failure(
      {List<InOutScenarioEntity>? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory InOutScenariosState.success(
      {required List<InOutScenarioEntity> data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

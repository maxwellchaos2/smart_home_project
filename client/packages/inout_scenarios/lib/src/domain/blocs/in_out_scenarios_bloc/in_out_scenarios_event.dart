part of 'in_out_scenarios_bloc.dart';

@freezed
class InOutScenariosEvent with _$InOutScenariosEvent {
  const factory InOutScenariosEvent.fetch() = _Fetch;

  @visibleForTesting
  const factory InOutScenariosEvent.$changed({
    required ChangedEvent<InOutScenarioEntity> event,
  }) = _Changed;
}

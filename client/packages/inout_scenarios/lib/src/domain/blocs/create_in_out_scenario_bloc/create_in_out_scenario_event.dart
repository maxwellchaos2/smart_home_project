part of 'create_in_out_scenario_bloc.dart';

@freezed
class CreateInOutScenarioEvent with _$CreateInOutScenarioEvent {
  const factory CreateInOutScenarioEvent.create({
    required InOutScenarioInputEntity input,
  }) = _Create;
}

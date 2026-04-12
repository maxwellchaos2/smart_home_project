part of 'update_in_out_scenario_bloc.dart';

@freezed
class UpdateInOutScenarioEvent with _$UpdateInOutScenarioEvent {
  const factory UpdateInOutScenarioEvent.update({
    required InOutScenarioInputEntity input,
  }) = _Update;
}

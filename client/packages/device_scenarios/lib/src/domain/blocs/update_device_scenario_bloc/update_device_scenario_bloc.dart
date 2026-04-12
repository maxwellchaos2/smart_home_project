import 'package:common/common.dart';

import '../../domain.dart';

part 'update_device_scenario_bloc.freezed.dart';
part 'update_device_scenario_event.dart';
part 'update_device_scenario_state.dart';

final class UpdateDeviceScenarioBloc
    extends Bloc<UpdateDeviceScenarioEvent, UpdateDeviceScenarioState> {
  final IDeviceScenariosRepository _repository;

  final int _scenarioId;
  final int _projectId;

  UpdateDeviceScenarioBloc({
    required IDeviceScenariosRepository repository,
    required int scenarioId,
    required int projectId,
  })  : _repository = repository,
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(const UpdateDeviceScenarioState.initial()) {
    on<UpdateDeviceScenarioEvent>(
      (event, emit) => event.map(
        update: (event) => _update(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _update(
          _Update event, Emitter<UpdateDeviceScenarioState> emit) =>
      emit.load(state, () async {
        final data = await _repository.update(
            id: _scenarioId, projectId: _projectId, input: event.input);
        emit(UpdateDeviceScenarioState.success(data: data));
      });
}

extension on Emitter<UpdateDeviceScenarioState> {
  Future<void> load(
      UpdateDeviceScenarioState state, Future<void> Function() func) async {
    try {
      call(const UpdateDeviceScenarioState.loading());
      await func();
    } on Failure catch (e) {
      call(UpdateDeviceScenarioState.failure(failure: e));
    } on Object {
      call(const UpdateDeviceScenarioState.failure());
      rethrow;
    }
  }
}

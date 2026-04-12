import 'package:common/common.dart';

import '../../domain.dart';

part 'delete_device_scenario_bloc.freezed.dart';
part 'delete_device_scenario_event.dart';
part 'delete_device_scenario_state.dart';

final class DeleteDeviceScenarioBloc
    extends Bloc<DeleteDeviceScenarioEvent, DeleteDeviceScenarioState> {
  final IDeviceScenariosRepository _repository;
  final int _projectId;

  final int _scenarioId;

  DeleteDeviceScenarioBloc({
    required IDeviceScenariosRepository repository,
    required int scenarioId,
    required int projectId,
  })  : _repository = repository,
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(const DeleteDeviceScenarioState.initial()) {
    on<DeleteDeviceScenarioEvent>(
      (event, emit) => event.map(
        delete: (event) => _delete(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _delete(
          _Delete event, Emitter<DeleteDeviceScenarioState> emit) =>
      emit.load(state, () async {
        await _repository.delete(
          projectId: _projectId,
          id: _scenarioId,
        );
        emit(const DeleteDeviceScenarioState.success());
      });
}

extension on Emitter<DeleteDeviceScenarioState> {
  Future<void> load(
      DeleteDeviceScenarioState state, Future<void> Function() func) async {
    try {
      call(const DeleteDeviceScenarioState.loading());
      await func();
    } on Failure catch (e) {
      call(DeleteDeviceScenarioState.failure(failure: e));
    } on Object {
      call(const DeleteDeviceScenarioState.failure());
      rethrow;
    }
  }
}

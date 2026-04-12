import 'package:common/common.dart';

import '../../domain.dart';

part 'delete_in_out_scenario_bloc.freezed.dart';
part 'delete_in_out_scenario_event.dart';
part 'delete_in_out_scenario_state.dart';

final class DeleteInOutScenarioBloc
    extends Bloc<DeleteInOutScenarioEvent, DeleteInOutScenarioState> {
  final IInOutScenariosRepository _repository;
  final int _scenarioId;
  final int _projectId;

  DeleteInOutScenarioBloc({
    required IInOutScenariosRepository repository,
    required int scenarioId,
    required int projectId,
  })  : _repository = repository,
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(const DeleteInOutScenarioState.initial()) {
    on<DeleteInOutScenarioEvent>(
      (event, emit) => event.map(
        delete: (event) => _delete(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _delete(_Delete event, Emitter<DeleteInOutScenarioState> emit) =>
      emit.load(state, () async {
        await _repository.delete(id: _scenarioId, projectId: _projectId);
        emit(DeleteInOutScenarioState.success());
      });
}

extension on Emitter<DeleteInOutScenarioState> {
  Future<void> load(
      DeleteInOutScenarioState state, Future<void> Function() func) async {
    try {
      call(const DeleteInOutScenarioState.loading());
      await func();
    } on Failure catch (e) {
      call(DeleteInOutScenarioState.failure(failure: e));
    } on Object {
      call(const DeleteInOutScenarioState.failure());
      rethrow;
    }
  }
}

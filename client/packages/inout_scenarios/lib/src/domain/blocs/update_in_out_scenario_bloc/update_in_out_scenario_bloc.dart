import 'package:common/common.dart';

import '../../domain.dart';

part 'update_in_out_scenario_bloc.freezed.dart';
part 'update_in_out_scenario_event.dart';
part 'update_in_out_scenario_state.dart';

final class UpdateInOutScenarioBloc
    extends Bloc<UpdateInOutScenarioEvent, UpdateInOutScenarioState> {
  final IInOutScenariosRepository _repository;

  final int _scenarioId;

  final int _projectId;

  UpdateInOutScenarioBloc({
    required IInOutScenariosRepository repository,
    required int scenarioId,
    required int projectId,
  })  : _repository = repository,
        _scenarioId = scenarioId,
        _projectId = projectId,
        super(const UpdateInOutScenarioState.initial()) {
    on<UpdateInOutScenarioEvent>(
      (event, emit) => event.map(
        update: (event) => _update(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _update(_Update event, Emitter<UpdateInOutScenarioState> emit) =>
      emit.load(state, () async {
        final data = await _repository.update(
          id: _scenarioId,
          input: event.input,
          projectId: _projectId,
        );
        emit(UpdateInOutScenarioState.success(data: data));
      });
}

extension on Emitter<UpdateInOutScenarioState> {
  Future<void> load(
      UpdateInOutScenarioState state, Future<void> Function() func) async {
    try {
      call(const UpdateInOutScenarioState.loading());
      await func();
    } on Failure catch (e) {
      call(UpdateInOutScenarioState.failure(failure: e));
    } on Object {
      call(const UpdateInOutScenarioState.failure());
      rethrow;
    }
  }
}

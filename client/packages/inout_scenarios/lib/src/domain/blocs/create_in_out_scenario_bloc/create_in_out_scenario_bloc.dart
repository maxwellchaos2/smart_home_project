import 'package:common/common.dart';

import '../../domain.dart';

part 'create_in_out_scenario_bloc.freezed.dart';
part 'create_in_out_scenario_event.dart';
part 'create_in_out_scenario_state.dart';

final class CreateInOutScenarioBloc
    extends Bloc<CreateInOutScenarioEvent, CreateInOutScenarioState> {
  final IInOutScenariosRepository _repository;
  final int _projectId;

  CreateInOutScenarioBloc({
    required IInOutScenariosRepository repository,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(const CreateInOutScenarioState.initial()) {
    on<CreateInOutScenarioEvent>(
      (event, emit) => event.map(
        create: (event) => _create(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _create(_Create event, Emitter<CreateInOutScenarioState> emit) =>
      emit.load(state, () async {
        final data = await _repository.create(
          input: event.input,
          projectId: _projectId,
        );
        emit(CreateInOutScenarioState.success(data: data));
      });
}

extension on Emitter<CreateInOutScenarioState> {
  Future<void> load(
      CreateInOutScenarioState state, Future<void> Function() func) async {
    try {
      call(const CreateInOutScenarioState.loading());
      await func();
    } on Failure catch (e) {
      call(CreateInOutScenarioState.failure(failure: e));
    } on Object {
      call(const CreateInOutScenarioState.failure());
      rethrow;
    }
  }
}

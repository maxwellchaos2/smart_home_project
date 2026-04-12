import 'package:common/common.dart';

import '../../domain.dart';

part 'create_device_scenario_bloc.freezed.dart';
part 'create_device_scenario_event.dart';
part 'create_device_scenario_state.dart';

final class CreateDeviceScenarioBloc
    extends Bloc<CreateDeviceScenarioEvent, CreateDeviceScenarioState> {
  final IDeviceScenariosRepository _repository;

  final int _projectId;

  CreateDeviceScenarioBloc({
    required IDeviceScenariosRepository repository,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(const CreateDeviceScenarioState.initial()) {
    on<CreateDeviceScenarioEvent>(
      (event, emit) => event.map(
        create: (event) => _create(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _create(
          _Create event, Emitter<CreateDeviceScenarioState> emit) =>
      emit.load(state, () async {
        final data = await _repository.create(
          input: event.input,
          projectId: _projectId,
        );
        emit(CreateDeviceScenarioState.success(data: data));
      });
}

extension on Emitter<CreateDeviceScenarioState> {
  Future<void> load(
      CreateDeviceScenarioState state, Future<void> Function() func) async {
    try {
      call(const CreateDeviceScenarioState.loading());
      await func();
    } on Failure catch (e) {
      call(CreateDeviceScenarioState.failure(failure: e));
    } on Object {
      call(const CreateDeviceScenarioState.failure());
      rethrow;
    }
  }
}

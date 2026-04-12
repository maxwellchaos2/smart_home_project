import 'package:common/common.dart';

import '../../domain.dart';

part 'device_scenario_run_bloc.freezed.dart';
part 'device_scenario_run_event.dart';
part 'device_scenario_run_state.dart';

final class DeviceScenarioRunBloc
    extends Bloc<DeviceScenarioRunEvent, DeviceScenarioRunState> {
  final IDeviceScenariosRepository _repository;

  final int _projectId;

  DeviceScenarioRunBloc({
    required IDeviceScenariosRepository repository,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(const DeviceScenarioRunState.initial()) {
    on<DeviceScenarioRunEvent>(
      (event, emit) => event.map(
        run: (event) => _run(event, emit),
      ),
    );
  }

  Future<void> _run(_Run event, Emitter<DeviceScenarioRunState> emit) =>
      emit.load(state, () async {
        await _repository.run(
          id: event.id,
          projectId: _projectId,
        );
        emit(const DeviceScenarioRunState.success());
      });
}

extension on Emitter<DeviceScenarioRunState> {
  Future<void> load(
      DeviceScenarioRunState state, Future<void> Function() func) async {
    try {
      call(const DeviceScenarioRunState.loading());
      await func();
    } on Failure catch (e) {
      call(DeviceScenarioRunState.failure(failure: e));
    } on Object {
      call(const DeviceScenarioRunState.failure());
      rethrow;
    }
  }
}

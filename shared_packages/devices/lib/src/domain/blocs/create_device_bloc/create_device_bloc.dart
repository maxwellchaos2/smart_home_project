import 'package:common/common.dart';
import 'package:devices_entities/devices_entities.dart';

import '../../domain.dart';

part 'create_device_bloc.freezed.dart';
part 'create_device_event.dart';
part 'create_device_state.dart';

final class CreateDeviceBloc
    extends Bloc<CreateDeviceEvent, CreateDeviceState> {
  final IDevicesRepository _repository;

  final int _projectId;

  CreateDeviceBloc({
    required IDevicesRepository repository,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(const CreateDeviceState.initial()) {
    on<CreateDeviceEvent>(
      (event, emit) => event.map(
        create: (event) => _create(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _create(_Create event, Emitter<CreateDeviceState> emit) =>
      emit.load(state, () async {
        final data = await _repository.createDevice(
            input: event.input, projectId: _projectId);
        emit(CreateDeviceState.success(data: data));
      });
}

extension on Emitter<CreateDeviceState> {
  Future<void> load(
      CreateDeviceState state, Future<void> Function() func) async {
    try {
      call(const CreateDeviceState.loading());
      await func();
    } on Failure catch (e) {
      call(CreateDeviceState.failure(failure: e));
    } on Object {
      call(const CreateDeviceState.failure());
      rethrow;
    }
  }
}

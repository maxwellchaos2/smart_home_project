import 'package:common/common.dart';

import '../../domain.dart';

part 'update_device_bloc.freezed.dart';
part 'update_device_event.dart';
part 'update_device_state.dart';

final class UpdateDeviceBloc
    extends Bloc<UpdateDeviceEvent, UpdateDeviceState> {
  final IDevicesRepository _repository;

  final int _deviceId;
  final int _projectId;

  UpdateDeviceBloc({
    required IDevicesRepository repository,
    required int deviceId,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        _deviceId = deviceId,
        super(const UpdateDeviceState.initial()) {
    on<UpdateDeviceEvent>(
      (event, emit) => event.map(
        update: (event) => _update(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _update(_Update event, Emitter<UpdateDeviceState> emit) =>
      emit.load(state, () async {
        final data = await _repository.updateDevice(
          id: _deviceId,
          input: event.input,
          projectId: _projectId,
        );
        emit(UpdateDeviceState.success(data: data));
      });
}

extension on Emitter<UpdateDeviceState> {
  Future<void> load(
      UpdateDeviceState state, Future<void> Function() func) async {
    try {
      call(const UpdateDeviceState.loading());
      await func();
    } on Failure catch (e) {
      call(UpdateDeviceState.failure(failure: e));
    } on Object {
      call(const UpdateDeviceState.failure());
      rethrow;
    }
  }
}

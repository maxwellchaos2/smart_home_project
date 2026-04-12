import 'package:common/common.dart';

import '../../domain.dart';

part 'delete_device_bloc.freezed.dart';
part 'delete_device_event.dart';
part 'delete_device_state.dart';

final class DeleteDeviceBloc
    extends Bloc<DeleteDeviceEvent, DeleteDeviceState> {
  final IDevicesRepository _repository;

  final int _deviceId;
  final int _projectId;

  DeleteDeviceBloc({
    required IDevicesRepository repository,
    required int deviceId,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        _deviceId = deviceId,
        super(const DeleteDeviceState.initial()) {
    on<DeleteDeviceEvent>(
      (event, emit) => event.map(
        delete: (event) => _delete(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _delete(_Delete event, Emitter<DeleteDeviceState> emit) =>
      emit.load(state, () async {
        await _repository.deleteDevice(id: _deviceId, projectId: _projectId);
        emit(DeleteDeviceState.success());
      });
}

extension on Emitter<DeleteDeviceState> {
  Future<void> load(
      DeleteDeviceState state, Future<void> Function() func) async {
    try {
      call(const DeleteDeviceState.loading());
      await func();
    } on Failure catch (e) {
      call(DeleteDeviceState.failure(failure: e));
    } on Object {
      call(const DeleteDeviceState.failure());
      rethrow;
    }
  }
}

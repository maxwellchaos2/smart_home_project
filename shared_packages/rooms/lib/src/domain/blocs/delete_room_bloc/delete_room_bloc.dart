import 'package:common/common.dart';

import '../../domain.dart';

part 'delete_room_bloc.freezed.dart';
part 'delete_room_event.dart';
part 'delete_room_state.dart';

final class DeleteRoomBloc extends Bloc<DeleteRoomEvent, DeleteRoomState> {
  final IRoomsRepository _repository;
  final int _roomId;

  final int _projectId;

  DeleteRoomBloc({
    required IRoomsRepository repository,
    required int roomId,
    required int projectId,
  })  : _repository = repository,
        _roomId = roomId,
        _projectId = projectId,
        super(const DeleteRoomState.initial()) {
    on<DeleteRoomEvent>(
      (event, emit) => event.map(
        delete: (event) => _delete(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _delete(_Delete event, Emitter<DeleteRoomState> emit) =>
      emit.load(state, () async {
        await _repository.deleteRoom(
          id: _roomId,
          projectId: _projectId,
        );
        emit(DeleteRoomState.success());
      });
}

extension on Emitter<DeleteRoomState> {
  Future<void> load(DeleteRoomState state, Future<void> Function() func) async {
    try {
      call(const DeleteRoomState.loading());
      await func();
    } on Failure catch (e) {
      call(DeleteRoomState.failure(failure: e));
    } on Object {
      call(const DeleteRoomState.failure());
      rethrow;
    }
  }
}

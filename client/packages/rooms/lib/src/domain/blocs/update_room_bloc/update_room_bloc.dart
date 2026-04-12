import 'package:common/common.dart';

import '../../domain.dart';

part 'update_room_bloc.freezed.dart';
part 'update_room_event.dart';
part 'update_room_state.dart';

final class UpdateRoomBloc extends Bloc<UpdateRoomEvent, UpdateRoomState> {
  final IRoomsRepository _repository;

  final int _roomId;
  final int _projectId;

  UpdateRoomBloc({
    required IRoomsRepository repository,
    required int roomId,
    required int projectId,
  })  : _repository = repository,
        _roomId = roomId,
        _projectId = projectId,
        super(const UpdateRoomState.initial()) {
    on<UpdateRoomEvent>(
      (event, emit) => event.map(
        update: (event) => _update(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _update(_Update event, Emitter<UpdateRoomState> emit) =>
      emit.load(state, () async {
        final data = await _repository.updateRoom(
          id: _roomId,
          input: event.input,
          projectId: _projectId,
        );
        emit(UpdateRoomState.success(data: data));
      });
}

extension on Emitter<UpdateRoomState> {
  Future<void> load(UpdateRoomState state, Future<void> Function() func) async {
    try {
      call(const UpdateRoomState.loading());
      await func();
    } on Failure catch (e) {
      call(UpdateRoomState.failure(failure: e));
    } on Object {
      call(const UpdateRoomState.failure());
      rethrow;
    }
  }
}

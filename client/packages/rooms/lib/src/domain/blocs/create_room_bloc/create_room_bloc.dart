import 'package:common/common.dart';

import '../../domain.dart';

part 'create_room_bloc.freezed.dart';
part 'create_room_event.dart';
part 'create_room_state.dart';

final class CreateRoomBloc extends Bloc<CreateRoomEvent, CreateRoomState> {
  final IRoomsRepository _repository;

  final int _projectId;

  CreateRoomBloc({
    required IRoomsRepository repository,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(const CreateRoomState.initial()) {
    on<CreateRoomEvent>(
      (event, emit) => event.map(
        create: (event) => _create(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _create(_Create event, Emitter<CreateRoomState> emit) =>
      emit.load(state, () async {
        final data = await _repository.createRoom(
          input: event.input,
          projectId: _projectId,
        );
        emit(CreateRoomState.success(data: data));
      });
}

extension on Emitter<CreateRoomState> {
  Future<void> load(CreateRoomState state, Future<void> Function() func) async {
    try {
      call(const CreateRoomState.loading());
      await func();
    } on Failure catch (e) {
      call(CreateRoomState.failure(failure: e));
    } on Object {
      call(const CreateRoomState.failure());
      rethrow;
    }
  }
}

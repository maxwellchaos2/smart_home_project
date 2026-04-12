import 'package:common/common.dart';

import '../../domain.dart';

part 'open_door_bloc.freezed.dart';
part 'open_door_event.dart';
part 'open_door_state.dart';

final class OpenDoorBloc extends Bloc<OpenDoorEvent, OpenDoorState> {
  final IAccessControlRepository _repository;
  final int _doorId;

  OpenDoorBloc({
    required IAccessControlRepository repository,
    required int doorId,
  })  : _repository = repository,
        _doorId = doorId,
        super(const OpenDoorState.initial()) {
    on<OpenDoorEvent>(
      (event, emit) => event.map(
        open: (event) => _open(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _open(_Open event, Emitter<OpenDoorState> emit) =>
      emit.load(state, () async {
        final data = await _repository.openDoor(doorId: _doorId);
        emit(OpenDoorState.success(data: data));
      });
}

extension on Emitter<OpenDoorState> {
  Future<void> load(OpenDoorState state, Future<void> Function() func) async {
    try {
      call(const OpenDoorState.loading());
      await func();
    } on Failure catch (e) {
      call(OpenDoorState.failure(failure: e));
    } on Object {
      call(const OpenDoorState.failure());
      rethrow;
    }
  }
}

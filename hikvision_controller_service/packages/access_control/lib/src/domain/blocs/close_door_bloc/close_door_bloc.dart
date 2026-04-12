import 'package:common/common.dart';
import '../../domain.dart';

part 'close_door_event.dart';
part 'close_door_state.dart';
part 'close_door_bloc.freezed.dart';

final class CloseDoorBloc extends Bloc<CloseDoorEvent, CloseDoorState> {
  final IAccessControlRepository _repository;

  final int _doorId;

  CloseDoorBloc({
    required IAccessControlRepository repository,
    required int doorId,
  })  : _repository = repository,
        _doorId = doorId,
        super(const CloseDoorState.initial()) {
    on<CloseDoorEvent>(
      (event, emit) => event.map(
        close: (event) => _close(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _close(_Close event, Emitter<CloseDoorState> emit) =>
      emit.load(state, () async {
        final data = await _repository.closeDoor(doorId: _doorId);
        emit(CloseDoorState.success(data: data));
      });
}

extension on Emitter<CloseDoorState> {
  Future<void> load(CloseDoorState state, Future<void> Function() func) async {
    try {
      call(const CloseDoorState.loading());
      await func();
    } on Failure catch (e) {
      call(CloseDoorState.failure(failure: e));
    } on Object {
      call(const CloseDoorState.failure());
      rethrow;
    }
  }
}

import 'package:common/common.dart';

import '../../domain.dart';

part 'floors_bloc.freezed.dart';
part 'floors_event.dart';
part 'floors_state.dart';

final class FloorsBloc extends Bloc<FloorsEvent, FloorsState> {
  final IFloorsRepository _repository;

  final int _projectId;

  FloorsBloc({
    required IFloorsRepository repository,
    required int projectId,
    List<FloorEntity>? initData,
  })  : _repository = repository,
        _projectId = projectId,
        super(FloorsState.initial(data: initData)) {
    on<FloorsEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
      ),
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<FloorsState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchAll(projectId: _projectId);
        emit(FloorsState.success(data: data));
      });
}

extension on Emitter<FloorsState> {
  Future<void> load(FloorsState state, Future<void> Function() func) async {
    try {
      call(FloorsState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(FloorsState.failure(failure: e, data: state.data));
    } on Object {
      call(FloorsState.failure(data: state.data));
      rethrow;
    }
  }
}

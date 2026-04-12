import 'dart:async';

import 'package:common/common.dart';

import '../../domain.dart';

part 'in_out_scenarios_bloc.freezed.dart';
part 'in_out_scenarios_event.dart';
part 'in_out_scenarios_state.dart';

final class InOutScenariosBloc
    extends Bloc<InOutScenariosEvent, InOutScenariosState> {
  final IInOutScenariosRepository _repository;

  late final StreamSubscription<ChangedEvent<InOutScenarioEntity>>
      _changedSubscription;

  final int _projectId;

  InOutScenariosBloc({
    required IInOutScenariosRepository repository,
    required int projectId,
    List<InOutScenarioEntity>? initData,
  })  : _repository = repository,
        _projectId = projectId,
        super(InOutScenariosState.initial(data: initData)) {
    on<InOutScenariosEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
        $changed: (event) => _changed(event, emit),
      ),
    );

    _changedSubscription = _repository.onChanged.listen(
      (event) {
        add(InOutScenariosEvent.$changed(event: event));
      },
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<InOutScenariosState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchAll(projectId: _projectId);
        emit(InOutScenariosState.success(data: data));
      });

  Future<void> _changed(
      _Changed event, Emitter<InOutScenariosState> emit) async {
    if (state.hasData) {
      final newData = state.data!.toList();

      event.event.mapOrNull(
        created: (event) {
          newData.insert(0, event.item);
          emit(state.copyWith(data: newData));
        },
        updated: (event) {
          final replaced =
              newData.replaceWhere(event.item, (p) => p.id == event.item.id);
          if (replaced) {
            emit(state.copyWith(data: newData));
          }
        },
        deleted: (event) {
          newData.removeWhere((p) => p.id == event.itemId);
          if (newData != state.data) {
            emit(state.copyWith(data: newData));
          }
        },
      );
    }
  }

  @override
  Future<void> close() {
    _changedSubscription.cancel();
    return super.close();
  }
}

extension on Emitter<InOutScenariosState> {
  Future<void> load(
      InOutScenariosState state, Future<void> Function() func) async {
    try {
      call(InOutScenariosState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(InOutScenariosState.failure(failure: e, data: state.data));
    } on Object {
      call(InOutScenariosState.failure(data: state.data));
      rethrow;
    }
  }
}

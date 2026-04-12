import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

import '../../domain.dart';

part 'rooms_bloc.freezed.dart';
part 'rooms_event.dart';
part 'rooms_state.dart';

final class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final IRoomsRepository _repository;

  late final StreamSubscription<List<ChangedEvent<RoomEntity>>>
      _changedSubscription;

  final int _projectId;

  RoomsBloc({
    required IRoomsRepository repository,
    List<RoomEntity>? initData,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(RoomsState.initial(data: initData)) {
    on<RoomsEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
        $changed: (value) => _changed(value, emit),
      ),
    );
    _changedSubscription = _repository.onChanged.listen(
      (events) {
        add(RoomsEvent.$changed(events: events));
      },
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<RoomsState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchAll(
          projectId: _projectId,
        );
        emit(RoomsState.success(data: data));
      });

  Future<void> _changed(_Changed event, Emitter<RoomsState> emit) async {
    if (state.hasData) {
      final newData = state.data!.toList();

      for (final event in event.events) {
        event.mapOrNull(
          created: (event) {
            if (newData.any((p) => p.id == event.item.id)) {
              return;
            }
            newData.add(event.item);
          },
          updated: (event) {
            newData.replaceWhere(event.item, (p) => p.id == event.item.id);
          },
          deleted: (event) {
            newData.removeWhere((p) => p.id == event.itemId);
          },
        );
      }
      if (!listEquals(newData, state.data)) {
        emit(state.copyWith(data: newData));
      }
    }
  }

  @override
  Future<void> close() {
    _changedSubscription.cancel();
    return super.close();
  }
}

extension on Emitter<RoomsState> {
  Future<void> load(RoomsState state, Future<void> Function() func) async {
    try {
      call(RoomsState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(RoomsState.failure(failure: e, data: state.data));
    } on Object {
      call(RoomsState.failure(data: state.data));
      rethrow;
    }
  }
}

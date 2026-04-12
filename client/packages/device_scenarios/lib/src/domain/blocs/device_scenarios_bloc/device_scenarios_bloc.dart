import 'dart:async';

import 'package:common/common.dart';

import '../../domain.dart';

part 'device_scenarios_bloc.freezed.dart';
part 'device_scenarios_event.dart';
part 'device_scenarios_state.dart';

final class DeviceScenariosBloc
    extends Bloc<DeviceScenariosEvent, DeviceScenariosState> {
  final IDeviceScenariosRepository _repository;

  late final StreamSubscription<ChangedEvent<DeviceScenarioEntity>>
      _changedSubscription;

  final int _projectId;
  DeviceScenariosBloc({
    required IDeviceScenariosRepository repository,
    List<DeviceScenarioEntity>? initData,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(DeviceScenariosState.initial(data: initData)) {
    on<DeviceScenariosEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
        $changed: (event) => _changed(event, emit),
      ),
    );

    _changedSubscription = _repository.onChanged.listen(
      (event) {
        add(DeviceScenariosEvent.$changed(event: event));
      },
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<DeviceScenariosState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchAll(projectId: _projectId);
        emit(DeviceScenariosState.success(data: data));
      });

  Future<void> _changed(
      _Changed event, Emitter<DeviceScenariosState> emit) async {
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

extension on Emitter<DeviceScenariosState> {
  Future<void> load(
      DeviceScenariosState state, Future<void> Function() func) async {
    try {
      call(DeviceScenariosState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(DeviceScenariosState.failure(failure: e, data: state.data));
    } on Object {
      call(DeviceScenariosState.failure(data: state.data));
      rethrow;
    }
  }
}

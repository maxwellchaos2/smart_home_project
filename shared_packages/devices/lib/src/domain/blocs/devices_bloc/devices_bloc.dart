import 'dart:async';

import 'package:common/common.dart';
import 'package:devices_entities/devices_entities.dart';

import '../../domain.dart';

part 'devices_bloc.freezed.dart';
part 'devices_event.dart';
part 'devices_state.dart';

final class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  final IDevicesRepository _repository;

  late final StreamSubscription<List<ChangedEvent<DeviceEntity>>>
      _changedSubscription;

  final int _projectId;

  DevicesBloc({
    required IDevicesRepository repository,
    List<DeviceEntity>? initData,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(DevicesState.initial(data: initData)) {
    on<DevicesEvent>(
      (event, emit) => event.mapOrNull(
        fetch: (event) => _fetch(event, emit),
        $changed: (event) => _changed(event, emit),
      ),
    );

    on<_NeedChangeDevicesCapabilities>(
      (event, emit) async {
        await _repository.needChangeDevicesCapabilities(inputs: event.inputs);
      },
      transformer: concurrent(),
    );

    on<_DevicesCapabilitiesChanged>(
      (event, emit) async {
        await _repository.devicesCapabilitiesChanged(inputs: event.inputs);
      },
      transformer: concurrent(),
    );

    on<_DevicesPropertiesChanged>(
      (event, emit) async {
        await _repository.devicesPropertiesChanged(inputs: event.inputs);
      },
      transformer: concurrent(),
    );

    _changedSubscription = _repository.onChanged.listen(
      (events) {
        add(DevicesEvent.$changed(events: events));
      },
    );
  }

  Future<void> _fetch(_Fetch event, Emitter<DevicesState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchAll(projectId: _projectId);
        emit(DevicesState.success(data: data));
      });

  Future<void> _changed(_Changed event, Emitter<DevicesState> emit) async {
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
      if (!ListEquality().equals(newData, state.data)) {
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

extension on Emitter<DevicesState> {
  Future<void> load(DevicesState state, Future<void> Function() func) async {
    try {
      call(DevicesState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(DevicesState.failure(failure: e, data: state.data));
    } on Object {
      call(DevicesState.failure(data: state.data));
      rethrow;
    }
  }
}

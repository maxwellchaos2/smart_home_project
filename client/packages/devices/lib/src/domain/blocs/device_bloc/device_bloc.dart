import 'dart:async';

import 'package:common/common.dart';

import '../../domain.dart';

part 'device_bloc.freezed.dart';
part 'device_event.dart';
part 'device_state.dart';

final class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final IDevicesRepository _repository;

  late final StreamSubscription<List<ChangedEvent<DeviceEntity>>>
      _changedSubscription;

  final int _deviceId;

  DeviceBloc({
    required IDevicesRepository repository,
    DeviceEntity? initData,
    required int deviceId,
  })  : _repository = repository,
        _deviceId = deviceId,
        super(DeviceState.initial(data: initData)) {
    on<DeviceEvent>(
      (event, emit) => event.map(
        $changed: (event) => emit(
          state.copyWith(data: event.event.item!),
        ),
      ),
    );

    _changedSubscription = _repository.onChanged.listen(
      (events) {
        for (final event in events) {
          if (event.item?.id == _deviceId) {
            add(DeviceEvent.$changed(event: event));
          }
        }
      },
    );
  }

  @override
  Future<void> close() {
    _changedSubscription.cancel();
    return super.close();
  }
}

// extension on Emitter<DeviceState> {
//   Future<void> load(DeviceState state, Future<void> Function() func) async {
//     try {
//       call(DeviceState.loading(data: state.data));
//       await func();
//     } on Failure catch (e) {
//       call(DeviceState.failure(failure: e, data: state.data));
//     } on Object {
//       call(DeviceState.failure(data: state.data));
//       rethrow;
//     }
//   }
// }

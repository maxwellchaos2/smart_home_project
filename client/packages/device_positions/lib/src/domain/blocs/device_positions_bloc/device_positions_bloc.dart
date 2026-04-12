import 'package:common/common.dart';

import '../../domain.dart';

part 'device_positions_bloc.freezed.dart';
part 'device_positions_event.dart';
part 'device_positions_state.dart';

final class DevicePositionsBloc
    extends Bloc<DevicePositionsEvent, DevicePositionsState> {
  final IDevicePositionsRepository _repository;

  DevicePositionsBloc({
    required IDevicePositionsRepository repository,
    List<DevicePositionEntity>? initData,
  })  : _repository = repository,
        super(DevicePositionsState.initial(data: initData)) {
    on<DevicePositionsEvent>(
      (event, emit) => event.map(
        fetchAll: (event) => _fetchAll(event, emit),
      ),
    );
  }

  Future<void> _fetchAll(_FetchAll event, Emitter<DevicePositionsState> emit) =>
      emit.load(state, () async {
        final data = await _repository.fetchAll();
        emit(DevicePositionsState.success(data: data));
      });
}

extension on Emitter<DevicePositionsState> {
  Future<void> load(
      DevicePositionsState state, Future<void> Function() func) async {
    try {
      call(DevicePositionsState.loading(data: state.data));
      await func();
    } on Failure catch (e) {
      call(DevicePositionsState.failure(failure: e, data: state.data));
    } on Object {
      call(DevicePositionsState.failure(data: state.data));
      rethrow;
    }
  }
}

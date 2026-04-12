import 'dart:async';

import 'package:common/common.dart';

import '../../domain.dart';

part 'search_zigbee_devices_bloc.freezed.dart';
part 'search_zigbee_devices_event.dart';
part 'search_zigbee_devices_state.dart';

final class SearchZigbeeDevicesBloc
    extends Bloc<SearchZigbeeDevicesEvent, SearchZigbeeDevicesState> {
  final IZigbeeDevicesRepository _repository;

  late final StreamSubscription<ZigbeeDeviceEntity>? _subscription;

  final int _projectId;

  SearchZigbeeDevicesBloc({
    required IZigbeeDevicesRepository repository,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(SearchZigbeeDevicesState.loading()) {
    on<SearchZigbeeDevicesEvent>(
      (event, emit) => event.mapOrNull(
        $found: (event) => _found(event, emit),
        $timeout: (event) => emit(SearchZigbeeDevicesState.timeout()),
      ),
    );

    on<_StartSearchZigbeeDevices>(
      (event, emit) async {
        emit(SearchZigbeeDevicesState.loading());
        await _repository.startSearchZigbeeDevices(
          projectId: _projectId,
        );
        if (state.isLoading) {
          add(const SearchZigbeeDevicesEvent.$timeout());
        }
      },
    );

    add(const SearchZigbeeDevicesEvent.startSearchZigbeeDevices());

    _subscription = _repository.onZigbeeDeviceFound.listen(
      (device) => add(SearchZigbeeDevicesEvent.$found(device: device)),
    );
  }

  Future<void> _found(
      _Found event, Emitter<SearchZigbeeDevicesState> emit) async {
    emit(SearchZigbeeDevicesState.success(data: event.device));
    // _repository.stopSearchZigbeeDevices(
    //   projectId: _projectId,
    // );
    if (event.device.interviewCompleted == true) {
      _subscription?.cancel();
    }
  }

  @override
  Future<void> close() {
    _repository.stopSearchZigbeeDevices(
      projectId: _projectId,
    );
    _subscription?.cancel();
    return super.close();
  }
}

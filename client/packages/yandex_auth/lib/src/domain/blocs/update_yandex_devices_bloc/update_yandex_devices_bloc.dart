import 'package:common/common.dart';

import '../../domain.dart';

part 'update_yandex_devices_bloc.freezed.dart';
part 'update_yandex_devices_event.dart';
part 'update_yandex_devices_state.dart';

final class UpdateYandexDevicesBloc
    extends Bloc<UpdateYandexDevicesEvent, UpdateYandexDevicesState> {
  final IYandexAuthRepository _repository;

  final int _projectId;

  UpdateYandexDevicesBloc({
    required IYandexAuthRepository repository,
    required int projectId,
  })  : _repository = repository,
        _projectId = projectId,
        super(const UpdateYandexDevicesState.initial()) {
    on<UpdateYandexDevicesEvent>(
      (event, emit) => event.map(
        update: (event) => _update(event, emit),
      ),
      transformer: droppable(),
    );
  }

  Future<void> _update(_Update event, Emitter<UpdateYandexDevicesState> emit) =>
      emit.load(state, () async {
        await _repository.updateYandexDevices(projectId: _projectId);
        emit(UpdateYandexDevicesState.success());
      });
}

extension on Emitter<UpdateYandexDevicesState> {
  Future<void> load(
      UpdateYandexDevicesState state, Future<void> Function() func) async {
    try {
      call(const UpdateYandexDevicesState.loading());
      await func();
    } on Failure catch (e) {
      call(UpdateYandexDevicesState.failure(failure: e));
    } on Object {
      call(const UpdateYandexDevicesState.failure());
      rethrow;
    }
  }
}

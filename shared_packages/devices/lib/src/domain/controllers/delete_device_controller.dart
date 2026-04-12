import '../domain.dart';

abstract interface class IDeleteDeviceController {
  DeleteDeviceState get state;

  Stream<DeleteDeviceState> get stateChanged;

  void delete();

  static IDeleteDeviceController create({
    required IDevicesRepository repository,
    required int deviceId,
    required int projectId,
  }) {
    final bloc = DeleteDeviceBloc(
      repository: repository,
      deviceId: deviceId,
      projectId: projectId,
    );
    return DeleteDeviceControllerImpl(bloc: bloc);
  }
}

final class DeleteDeviceControllerImpl implements IDeleteDeviceController {
  final DeleteDeviceBloc _bloc;
  const DeleteDeviceControllerImpl({required DeleteDeviceBloc bloc})
      : _bloc = bloc;

  @override
  DeleteDeviceState get state => _bloc.state;

  @override
  void delete() => _bloc.add(const DeleteDeviceEvent.delete());

  @override
  Stream<DeleteDeviceState> get stateChanged => _bloc.stream;
}

import 'package:devices/devices.dart';

import '../domain.dart';

abstract interface class IUpdateDeviceController {
  UpdateDeviceState get state;

  void update({required DeviceInputEntity input});

  Stream<UpdateDeviceState> get stateChanged;

  static IUpdateDeviceController create({
    required IDevicesRepository repository,
    required int projectId,
    required int deviceId,
  }) {
    final bloc = UpdateDeviceBloc(
      repository: repository,
      deviceId: deviceId,
      projectId: projectId,
    );
    return UpdateDeviceControllerImpl(bloc: bloc);
  }
}

final class UpdateDeviceControllerImpl implements IUpdateDeviceController {
  final UpdateDeviceBloc _bloc;
  const UpdateDeviceControllerImpl({required UpdateDeviceBloc bloc})
      : _bloc = bloc;

  @override
  UpdateDeviceState get state => _bloc.state;

  @override
  void update({required DeviceInputEntity input}) =>
      _bloc.add(UpdateDeviceEvent.update(input: input));

  @override
  Stream<UpdateDeviceState> get stateChanged => _bloc.stream;
}

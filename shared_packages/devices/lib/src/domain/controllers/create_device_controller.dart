import 'package:devices/devices.dart';

import '../domain.dart';

abstract interface class ICreateDeviceController {
  CreateDeviceState get state;

  void create({required DeviceInputEntity input});

  Stream<CreateDeviceState> get stateChanged;

  static ICreateDeviceController create_({
    required IDevicesRepository repository,
    required int projectId,
  }) {
    final bloc = CreateDeviceBloc(
      repository: repository,
      projectId: projectId,
    );
    return CreateDeviceControllerImpl(bloc: bloc);
  }
}

final class CreateDeviceControllerImpl implements ICreateDeviceController {
  final CreateDeviceBloc _bloc;
  const CreateDeviceControllerImpl({required CreateDeviceBloc bloc})
      : _bloc = bloc;

  @override
  CreateDeviceState get state => _bloc.state;

  @override
  void create({required DeviceInputEntity input}) =>
      _bloc.add(CreateDeviceEvent.create(input: input));

  @override
  Stream<CreateDeviceState> get stateChanged => _bloc.stream;
}

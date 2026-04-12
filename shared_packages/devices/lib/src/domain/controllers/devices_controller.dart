import 'package:devices/devices.dart';

import '../domain.dart';

abstract interface class IDevicesController {
  DevicesState get state;

  Stream<DevicesState> get stateChanged;

  static IDevicesController create({
    required IDevicesRepository repository,
    List<DeviceEntity>? initData,
    required int projectId,
  }) {
    final bloc = DevicesBloc(
      repository: repository,
      initData: initData,
      projectId: projectId,
    );
    return DevicesControllerImpl(bloc: bloc);
  }

  void fetch();
  void needChangeDevicesCapabilities(
      {required List<UpdateDevicesCapabilitiesInput> inputs});
  void devicesCapabilitiesChanged(
      {required List<UpdateDevicesCapabilitiesInput> inputs});
  void devicesPropertiesChanged(
      {required List<UpdateDevicesPropertiesInput> inputs});
}

final class DevicesControllerImpl implements IDevicesController {
  final DevicesBloc _bloc;
  const DevicesControllerImpl({required DevicesBloc bloc}) : _bloc = bloc;

  @override
  DevicesState get state => _bloc.state;

  @override
  void fetch() => _bloc.add(const DevicesEvent.fetch());

  @override
  void needChangeDevicesCapabilities(
          {required List<UpdateDevicesCapabilitiesInput> inputs}) =>
      _bloc.add(DevicesEvent.needChangeDevicesCapabilities(inputs: inputs));

  @override
  void devicesCapabilitiesChanged(
          {required List<UpdateDevicesCapabilitiesInput> inputs}) =>
      _bloc.add(DevicesEvent.devicesCapabilitiesChanged(inputs: inputs));

  @override
  void devicesPropertiesChanged(
          {required List<UpdateDevicesPropertiesInput> inputs}) =>
      _bloc.add(DevicesEvent.devicesPropertiesChanged(inputs: inputs));

  @override
  Stream<DevicesState> get stateChanged => _bloc.stream;
}

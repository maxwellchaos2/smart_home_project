import '../domain.dart';
  
abstract interface class IDevicesController {
  DevicesState get state;
    
  void fetch();
  void updateDevicesCapabilities({required List<UpdateDevicesCapabilitiesInput> inputs});
  void updateDevicesProperties({required List<UpdateDevicesPropertiesInput> inputs});
}
  
final class DevicesControllerImpl implements IDevicesController {
  final DevicesBloc _bloc;
  const DevicesControllerImpl({required DevicesBloc bloc}) : _bloc = bloc;
  
  @override
  DevicesState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const DevicesEvent.fetch());

  @override
  void updateDevicesCapabilities({required List<UpdateDevicesCapabilitiesInput> inputs}) => 
        _bloc.add(DevicesEvent.updateDevicesCapabilities(inputs: inputs));

  @override
  void updateDevicesProperties({required List<UpdateDevicesPropertiesInput> inputs}) => 
        _bloc.add(DevicesEvent.updateDevicesProperties(inputs: inputs));
}

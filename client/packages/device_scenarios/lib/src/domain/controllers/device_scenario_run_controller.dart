import '../domain.dart';
  
abstract interface class IDeviceScenarioRunController {
  DeviceScenarioRunState get state;
    
  void run({required int id});
}
  
final class DeviceScenarioRunControllerImpl implements IDeviceScenarioRunController {
  final DeviceScenarioRunBloc _bloc;
  const DeviceScenarioRunControllerImpl({required DeviceScenarioRunBloc bloc}) : _bloc = bloc;
  
  @override
  DeviceScenarioRunState get state => _bloc.state;
  
  @override
  void run({required int id}) => 
        _bloc.add(DeviceScenarioRunEvent.run(id: id));
}

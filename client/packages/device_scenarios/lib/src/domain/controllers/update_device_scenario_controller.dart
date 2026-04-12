import '../domain.dart';
  
abstract interface class IUpdateDeviceScenarioController {
  UpdateDeviceScenarioState get state;
    
  void update({required DeviceScenarioInputEntity input});
}
  
final class UpdateDeviceScenarioControllerImpl implements IUpdateDeviceScenarioController {
  final UpdateDeviceScenarioBloc _bloc;
  const UpdateDeviceScenarioControllerImpl({required UpdateDeviceScenarioBloc bloc}) : _bloc = bloc;
  
  @override
  UpdateDeviceScenarioState get state => _bloc.state;
  
  @override
  void update({required DeviceScenarioInputEntity input}) => 
        _bloc.add(UpdateDeviceScenarioEvent.update(input: input));
}

import '../domain.dart';
  
abstract interface class ICreateDeviceScenarioController {
  CreateDeviceScenarioState get state;
    
  void create({required DeviceScenarioInputEntity input});
}
  
final class CreateDeviceScenarioControllerImpl implements ICreateDeviceScenarioController {
  final CreateDeviceScenarioBloc _bloc;
  const CreateDeviceScenarioControllerImpl({required CreateDeviceScenarioBloc bloc}) : _bloc = bloc;
  
  @override
  CreateDeviceScenarioState get state => _bloc.state;
  
  @override
  void create({required DeviceScenarioInputEntity input}) => 
        _bloc.add(CreateDeviceScenarioEvent.create(input: input));
}

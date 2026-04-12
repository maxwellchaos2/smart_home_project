import '../domain.dart';
  
abstract interface class IDeleteDeviceScenarioController {
  DeleteDeviceScenarioState get state;
    
  void delete();
}
  
final class DeleteDeviceScenarioControllerImpl implements IDeleteDeviceScenarioController {
  final DeleteDeviceScenarioBloc _bloc;
  const DeleteDeviceScenarioControllerImpl({required DeleteDeviceScenarioBloc bloc}) : _bloc = bloc;
  
  @override
  DeleteDeviceScenarioState get state => _bloc.state;
  
  @override
  void delete() => 
        _bloc.add(const DeleteDeviceScenarioEvent.delete());
}

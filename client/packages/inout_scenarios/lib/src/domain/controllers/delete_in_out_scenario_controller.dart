import '../domain.dart';
  
abstract interface class IDeleteInOutScenarioController {
  DeleteInOutScenarioState get state;
    
  void delete();
}
  
final class DeleteInOutScenarioControllerImpl implements IDeleteInOutScenarioController {
  final DeleteInOutScenarioBloc _bloc;
  const DeleteInOutScenarioControllerImpl({required DeleteInOutScenarioBloc bloc}) : _bloc = bloc;
  
  @override
  DeleteInOutScenarioState get state => _bloc.state;
  
  @override
  void delete() => 
        _bloc.add(const DeleteInOutScenarioEvent.delete());
}

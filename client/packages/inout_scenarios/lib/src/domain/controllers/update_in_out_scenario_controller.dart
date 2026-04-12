import '../domain.dart';
  
abstract interface class IUpdateInOutScenarioController {
  UpdateInOutScenarioState get state;
    
  void update({required InOutScenarioInputEntity input});
}
  
final class UpdateInOutScenarioControllerImpl implements IUpdateInOutScenarioController {
  final UpdateInOutScenarioBloc _bloc;
  const UpdateInOutScenarioControllerImpl({required UpdateInOutScenarioBloc bloc}) : _bloc = bloc;
  
  @override
  UpdateInOutScenarioState get state => _bloc.state;
  
  @override
  void update({required InOutScenarioInputEntity input}) => 
        _bloc.add(UpdateInOutScenarioEvent.update(input: input));
}

import '../domain.dart';
  
abstract interface class ICreateInOutScenarioController {
  CreateInOutScenarioState get state;
    
  void create({required InOutScenarioInputEntity input});
}
  
final class CreateInOutScenarioControllerImpl implements ICreateInOutScenarioController {
  final CreateInOutScenarioBloc _bloc;
  const CreateInOutScenarioControllerImpl({required CreateInOutScenarioBloc bloc}) : _bloc = bloc;
  
  @override
  CreateInOutScenarioState get state => _bloc.state;
  
  @override
  void create({required InOutScenarioInputEntity input}) => 
        _bloc.add(CreateInOutScenarioEvent.create(input: input));
}

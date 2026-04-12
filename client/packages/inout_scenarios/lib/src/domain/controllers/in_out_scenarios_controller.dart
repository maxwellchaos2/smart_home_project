import '../domain.dart';
  
abstract interface class IInOutScenariosController {
  InOutScenariosState get state;
    
  void fetch();
}
  
final class InOutScenariosControllerImpl implements IInOutScenariosController {
  final InOutScenariosBloc _bloc;
  const InOutScenariosControllerImpl({required InOutScenariosBloc bloc}) : _bloc = bloc;
  
  @override
  InOutScenariosState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const InOutScenariosEvent.fetch());
}

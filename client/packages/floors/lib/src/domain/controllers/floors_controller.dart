import '../domain.dart';
  
abstract interface class IFloorsController {
  FloorsState get state;
    
  void fetch();
}
  
final class FloorsControllerImpl implements IFloorsController {
  final FloorsBloc _bloc;
  const FloorsControllerImpl({required FloorsBloc bloc}) : _bloc = bloc;
  
  @override
  FloorsState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const FloorsEvent.fetch());
}

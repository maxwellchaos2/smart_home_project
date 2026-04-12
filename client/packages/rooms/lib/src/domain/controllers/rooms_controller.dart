import '../domain.dart';
  
abstract interface class IRoomsController {
  RoomsState get state;
    
  void fetch();
}
  
final class RoomsControllerImpl implements IRoomsController {
  final RoomsBloc _bloc;
  const RoomsControllerImpl({required RoomsBloc bloc}) : _bloc = bloc;
  
  @override
  RoomsState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const RoomsEvent.fetch());
}

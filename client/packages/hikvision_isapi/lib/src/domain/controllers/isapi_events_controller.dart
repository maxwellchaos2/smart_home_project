import '../domain.dart';
  
abstract interface class IIsapiEventsController {
  IsapiEventsState get state;
    
  void paginate();
  void refresh();
}
  
final class IsapiEventsControllerImpl implements IIsapiEventsController {
  final IsapiEventsBloc _bloc;
  const IsapiEventsControllerImpl({required IsapiEventsBloc bloc}) : _bloc = bloc;
  
  @override
  IsapiEventsState get state => _bloc.state;
  
  @override
  void paginate() => 
        _bloc.add(const IsapiEventsEvent.paginate());

  @override
  void refresh() => 
        _bloc.add(const IsapiEventsEvent.refresh());
}

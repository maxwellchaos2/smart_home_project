import '../domain.dart';
  
abstract interface class IDeleteRoomController {
  DeleteRoomState get state;
    
  void delete();
}
  
final class DeleteRoomControllerImpl implements IDeleteRoomController {
  final DeleteRoomBloc _bloc;
  const DeleteRoomControllerImpl({required DeleteRoomBloc bloc}) : _bloc = bloc;
  
  @override
  DeleteRoomState get state => _bloc.state;
  
  @override
  void delete() => 
        _bloc.add(const DeleteRoomEvent.delete());
}

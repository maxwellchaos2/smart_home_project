import '../domain.dart';
  
abstract interface class IUpdateRoomController {
  UpdateRoomState get state;
    
  void update({required RoomInputEntity input});
}
  
final class UpdateRoomControllerImpl implements IUpdateRoomController {
  final UpdateRoomBloc _bloc;
  const UpdateRoomControllerImpl({required UpdateRoomBloc bloc}) : _bloc = bloc;
  
  @override
  UpdateRoomState get state => _bloc.state;
  
  @override
  void update({required RoomInputEntity input}) => 
        _bloc.add(UpdateRoomEvent.update(input: input));
}

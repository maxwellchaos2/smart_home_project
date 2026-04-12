import '../domain.dart';
  
abstract interface class ICreateRoomController {
  CreateRoomState get state;
    
  void create({required RoomInputEntity input});
}
  
final class CreateRoomControllerImpl implements ICreateRoomController {
  final CreateRoomBloc _bloc;
  const CreateRoomControllerImpl({required CreateRoomBloc bloc}) : _bloc = bloc;
  
  @override
  CreateRoomState get state => _bloc.state;
  
  @override
  void create({required RoomInputEntity input}) => 
        _bloc.add(CreateRoomEvent.create(input: input));
}

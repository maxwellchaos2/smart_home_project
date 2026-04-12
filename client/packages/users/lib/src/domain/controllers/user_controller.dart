import '../domain.dart';
  
abstract interface class IUserController {
  UserState get state;
    
  void fetch();
}
  
final class UserControllerImpl implements IUserController {
  final UserBloc _bloc;
  const UserControllerImpl({required UserBloc bloc}) : _bloc = bloc;
  
  @override
  UserState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const UserEvent.fetch());
}

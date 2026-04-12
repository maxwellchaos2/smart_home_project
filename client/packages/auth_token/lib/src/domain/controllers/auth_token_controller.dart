import '../domain.dart';
  
abstract interface class IAuthTokenController {
  AuthTokenState get state;
    
  void fetch();
  void revoke();
  void changed({required AuthTokenEntity? token});
}
  
final class AuthTokenControllerImpl implements IAuthTokenController {
  final AuthTokenBloc _bloc;
  const AuthTokenControllerImpl({required AuthTokenBloc bloc}) : _bloc = bloc;
  
  @override
  AuthTokenState get state => _bloc.state;
  
  @override
  void fetch() => 
        _bloc.add(const AuthTokenEvent.fetch());

  @override
  void revoke() => 
        _bloc.add(const AuthTokenEvent.revoke());

  @override
  void changed({required AuthTokenEntity? token}) => 
        _bloc.add(AuthTokenEvent.changed(token: token));
}

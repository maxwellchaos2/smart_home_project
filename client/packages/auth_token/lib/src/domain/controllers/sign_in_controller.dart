import '../domain.dart';
  
abstract interface class ISignInController {
  SignInState get state;
    
  void signIn({required SignInInputEntity data});
}
  
final class SignInControllerImpl implements ISignInController {
  final SignInBloc _bloc;
  const SignInControllerImpl({required SignInBloc bloc}) : _bloc = bloc;
  
  @override
  SignInState get state => _bloc.state;
  
  @override
  void signIn({required SignInInputEntity data}) => 
        _bloc.add(SignInEvent.signIn(data: data));
}
